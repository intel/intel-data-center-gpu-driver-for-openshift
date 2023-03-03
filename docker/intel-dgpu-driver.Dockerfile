# Copyright (c) 2023 Intel Corporation
# SPDX-License-Identifier: Apache-2.0

ARG DTK_AUTO
FROM ${DTK_AUTO} as builder

WORKDIR /build/

# Building cse(MEI) driver
RUN git clone -b 23WW04.5_550_MAIN --single-branch https://github.com/intel-gpu/intel-gpu-cse-backports.git && cd intel-gpu-cse-backports && export OS_TYPE=rhel_8 && export OS_VERSION="8.6" && make modules && make modules_install

# Building pmt(VSEC) driver
RUN git clone -b 23WW04.5_550_MAIN --single-branch https://github.com/intel-gpu/intel-gpu-pmt-backports.git && cd intel-gpu-pmt-backports && export OS_TYPE=rhel_8 && export OS_VERSION="8.6" && make modules && make modules_install

# Building i915 driver
RUN git clone -b RHEL86_23WW4.5_550_6379.0.25_221103.27 --single-branch https://github.com/intel-gpu/intel-gpu-i915-backports.git && cd intel-gpu-i915-backports && export LEX=flex; export YACC=bison && cp defconfigs/drm .config && make olddefconfig && make -j $(nproc) && make modules_install

# Firmware
RUN git clone -b 23WW04.5_550 --single-branch https://github.com/intel-gpu/intel-gpu-firmware.git && cd intel-gpu-firmware && mkdir -p firmware/license/ && cp -r COPYRIGHT firmware/license/

FROM registry.redhat.io/ubi8/ubi-minimal
RUN microdnf -y install kmod findutils
COPY --from=builder /etc/driver-toolkit-release.json /etc/
COPY --from=builder /lib/modules/$KERNEL_FULL_VERSION/ /opt/lib/modules/$KERNEL_FULL_VERSION/
COPY --from=builder /build/intel-gpu-firmware/firmware/ /firmware/i915/

RUN depmod -b /opt
