# Copyright (c) 2023 Intel Corporation
# SPDX-License-Identifier: Apache-2.0

ARG DTK_AUTO
FROM ${DTK_AUTO} as builder

WORKDIR /build/

# Building cse(MEI) driver. We are disabling this for now as it is not currently used.
# RUN git clone -b 23WW06.5_555_MAIN --single-branch https://github.com/intel-gpu/intel-gpu-cse-backports.git && cd intel-gpu-cse-backports && export OS_TYPE=rhel_8 && export OS_VERSION="8.6" && make modules && make modules_install

# Building pmt(VSEC) driver
RUN git clone -b 23WW06.5_555_MAIN --single-branch https://github.com/intel-gpu/intel-gpu-pmt-backports.git \
    && cd intel-gpu-pmt-backports \
    && install -D LICENSE /licenses/pmt/LICENSE
    && export OS_TYPE=rhel_8 && export OS_VERSION="8.6" \
    && make modules && make modules_install

# Building i915 driver
RUN git clone -b RHEL86_23WW6.5_555_6469.0.3_221221.3 --single-branch https://github.com/intel-gpu/intel-gpu-i915-backports.git \
    && cd intel-gpu-i915-backports \
    && install -D COPYING /licenses/i915/COPYING
    && export LEX=flex; export YACC=bison \
    && export KBUILD_EXTRA_SYMBOLS=/build/intel-gpu-pmt-backports/drivers/platform/x86/intel/Module.symvers \
    && cp defconfigs/drm .config \
    && make olddefconfig && make -j $(nproc) && make modules_install

# Firmware
RUN git clone -b 23WW06.5_555 --single-branch https://github.com/intel-gpu/intel-gpu-firmware.git \
    && install -D /build/intel-gpu-firmware/COPYRIGHT /licenses/firmware/COPYRIGHT \
    && install -D /build/intel-gpu-firmware/COPYRIGHT /build/intel-gpu-firmware/firmware/license/COPYRIGHT

FROM registry.redhat.io/ubi8/ubi-minimal:latest

LABEL vendor='Intel®'
LABEL version='0.1.0'
LABEL release=${KERNEL_FULL_VERSION}
LABEL name='intel-data-center-gpu-driver-container'
LABEL summary='Intel® Data Center GPU Driver Container Image'
LABEL description='Intel® Data Center GPU Driver container image for Red Hat OpenShift Container Platform'

RUN microdnf update -y && rm -rf /var/cache/yum
RUN microdnf -y install kmod findutils && microdnf clean all
COPY --from=builder /licenses/ /licenses/
COPY --from=builder /etc/driver-toolkit-release.json /etc/
COPY --from=builder /lib/modules/$KERNEL_FULL_VERSION/ /opt/lib/modules/$KERNEL_FULL_VERSION/
COPY --from=builder /build/intel-gpu-firmware/firmware/ /firmware/i915/

RUN depmod -b /opt
