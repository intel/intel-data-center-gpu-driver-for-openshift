## Intel Data Center GPU Driver Dockerfile Introduction
The Dockerfile is used to build and package Intel data center GPU driver container images for OCP releases. Since OCP follows a regular [release cycle](https://docs.openshift.com/dedicated/osd_architecture/osd_policy/osd-life-cycle.html) and releases new versions frequently, the RHCOS kernel used by each release may be different. This project must regularly release the driver container image to match the new kernel version used by each OCP release. We refer to this scenario as the **kernel upgrade scenario**.

In the Dockerfile, [Red Hat Driver Toolkit (DTK)](https://github.com/openshift/driver-toolkit) is used as the base image to build the kernel driver modules. DTK integrates all the necessary packages and tools for building kernel modules in the container environment on OCP cluster. Moreover, the proper DTK image version is distributed with the OCP release which ensures the kernel modules built match the RHCOS kernel shipped with the OCP version. 

`Note: ARG DTK_AUTO in the Dockerfile will be replaced automatically with the appropriate DTK image by KMM operator.`

Intel GPU Drivers uses Dynamic Kernel Module Support (DKMS) to release the RPM packages and on-premise build the driver modules on the RHEL server. With this Dockerfile, [Linux Kernel Build System](https://docs.kernel.org/kbuild/index.html) is used to build the driver modules.

Multiple drivers are compiled and packaged into a single driver container image. To ensure the correct driver release combination is packaged, Intel GPU Driver version is used to select the version of each driver.

For example: 
-	CSE/PMT Driver release tag: 23WW06.5_**555**_MAIN
-	I915 Driver release tag: RHEL86_23WW6.5_**555**_6469.0.3_221221.3
-	Firmware release tag: 23WW06.5_**555**

`Note: The Intel GPU driver version 555 is highlighted in bold.`

The [ubi-minimal](https://catalog.redhat.com/software/containers/ubi8/ubi-minimal/5c359a62bed8bd75a2c3fba8) image is used as the base image to package the kernel driver modules into the driver container image. To certify and release container images on the Red Hat Ecosystem Catalog, Red Hat requires using the [UBI image](https://redhat-connect.gitbook.io/partner-guide-for-red-hat-openshift-and-container/program-on-boarding/containers-with-red-hat-universal-base-image-ubi) as the base image to package software.
