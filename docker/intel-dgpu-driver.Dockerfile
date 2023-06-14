# Copyright (c) 2023 Intel Corporation
# SPDX-License-Identifier: Apache-2.0

# Intel Data Center GPU driver components combinations.
# ARG CSE_RELEASE=23WW06.5_555_MAIN
ARG PMT_RELEASE=23WW06.5_555_MAIN
ARG I915_RELEASE=RHEL86_23WW6.5_555_6469.0.3_221221.3
ARG FIRMWARE_RELEASE=23WW06.5_555

# Intel Data Center GPU Driver for OpenShift version.
ARG DRIVER_VERSION=0.1.0

# RHCOS Kernel version supported by the above driver version.
ARG KERNEL_VERSION
ARG KERNEL_FULL_VERSION=${KERNEL_VERSION}

# Red Hat DTK image is used as builder image to build kernel driver modules. 
# Appropriate DTK image is provided with the OCP release, to guarantee compatibility 
# between the built kernel modules and the OCP version's RHCOS kernel.
# DTK_AUTO is populated automatically with the appropriate DTK image by KMM operator.
ARG DTK_AUTO

FROM ${DTK_AUTO} as builder
# ARG CSE_RELEASE
ARG PMT_RELEASE
ARG I915_RELEASE
ARG FIRMWARE_RELEASE
ARG KERNEL_FULL_VERSION

WORKDIR /build

# Building cse(MEI) driver. We are disabling this for now as it is not currently used.
# RUN git clone -b ${CSE_RELEASE} --single-branch https://github.com/intel-gpu/intel-gpu-cse-backports.git && cd intel-gpu-cse-backports && export OS_TYPE=rhel_8 && export OS_VERSION="8.6" && make -j $(nproc) modules && make modules_install

# Building pmt(VSEC) driver
RUN git clone -b ${PMT_RELEASE} --single-branch https://github.com/intel-gpu/intel-gpu-pmt-backports.git \
    && cd intel-gpu-pmt-backports \
    && install -D LICENSE /licenses/pmt/LICENSE \
    && export OS_TYPE=rhel_8 && export OS_VERSION="8.6" \
    && make -j $(nproc) modules && make modules_install

# Building i915 driver
RUN git clone -b ${I915_RELEASE} --single-branch https://github.com/intel-gpu/intel-gpu-i915-backports.git \
    && cd intel-gpu-i915-backports \
    && install -D COPYING /licenses/i915/COPYING \
    && export LEX=flex; export YACC=bison \
    && export KBUILD_EXTRA_SYMBOLS=/build/intel-gpu-pmt-backports/drivers/platform/x86/intel/Module.symvers \
    && cp defconfigs/drm .config \
    && make olddefconfig && make -j $(nproc) && make modules_install

# Create /build/modules directory with all *.ko and *.ko.xz files
RUN mkdir -p /build/modules \
    && find /lib/modules/${KERNEL_FULL_VERSION}/ \
    -name "*.ko" -o -name "*.ko.xz" -o -name "modules.order" -o -name "modules.builtin" -type f \
    | xargs -I {} install -D {} /build/modules/

# Firmware
RUN git clone -b ${FIRMWARE_RELEASE} --single-branch https://github.com/intel-gpu/intel-gpu-firmware.git \
    && install -D /build/intel-gpu-firmware/COPYRIGHT /licenses/firmware/COPYRIGHT \
    && install -D /build/intel-gpu-firmware/COPYRIGHT /build/firmware/license/COPYRIGHT \
    && install -D /build/intel-gpu-firmware/firmware/dg2* /build/firmware/

# Packaging Intel GPU driver components in the base UBI image for certification
FROM registry.redhat.io/ubi8/ubi-minimal:latest
ARG DRIVER_VERSION
ARG KERNEL_FULL_VERSION
# ARG CSE_RELEASE
ARG PMT_RELEASE
ARG I915_RELEASE
ARG FIRMWARE_RELEASE

# Required labels for the image metadata
LABEL vendor="Intel®"
LABEL version="${DRIVER_VERSION}"
LABEL release="${KERNEL_FULL_VERSION}"
LABEL name="intel-data-center-gpu-driver-container"
LABEL summary="Intel® Data Center GPU Driver Container Image"
LABEL description="Intel® Data Center GPU Driver container image designed for Red Hat OpenShift Container Platform. \
The driver container is based on Intel Data Center GPU driver components - PMT driver release:${PMT_RELEASE}, i915 driver release:${I915_RELEASE}, \
and Firmware release:${FIRMWARE_RELEASE}. This driver container image is supported for RHOCP 4.12 RHCOS kernel version: ${KERNEL_FULL_VERSION}."

RUN microdnf update -y && rm -rf /var/cache/yum
RUN microdnf -y install kmod findutils && microdnf clean all
COPY --from=builder /licenses/ /licenses/
COPY --from=builder /etc/driver-toolkit-release.json /etc/
COPY --from=builder /build/modules/ /opt/lib/modules/${KERNEL_FULL_VERSION}/
COPY --from=builder /build/firmware/ /firmware/i915/

RUN depmod -b /opt ${KERNEL_FULL_VERSION}
