## Intel dGPU Driver Dockerfile Introduction
The [Dockerfile](intel-dgpu-driver.Dockerfile) is used to build and package intel dGPU driver container images for OCP releases. Since OCP does the regular [X, Y or Z release](https://docs.openshift.com/dedicated/osd_architecture/osd_policy/osd-life-cycle.html), the RHEL/RHCOS kernel version used by each release might be different. So, this project must regularly release the driver container image to match the new kernel version used by the latest OCP release. It is called kernel upgrading scenario support.

In the dockerfile Red Hat [Driver Toolkit (DTK)](https://github.com/openshift/driver-toolkit) is used as the base image to build the Kernel driver modules. DTK integrates all the necessary packages and tools for building kernel modules in the container environment. Moreover, the proper version of the DTK image is shipped with the OCP release which makes sure the kernel modules are built exactly matches the RHEL/RHCOS kernel shipped with the OCP version. 

`Notes: ARG DTK_AUTO in the dockerfile will be replaced automatically with the DTK image by KMM operator or CI/CD pipeline.`

[Intel GPU Drivers uses](https://github.com/intel-gpu) DKMS to release the PRM packages and on-premises build the drivers modules on the RHEL server. While In this Dockerfile,  [Linux Kernel Build System](https://docs.kernel.org/kbuild/index.html) is used to build the driver modules.

Multiple drivers are compiled and packaged into the single driver container image; To make sure the right driver release combination drivers are packaged, Intel GPU Driver version is used to select the version of each driver.

For example: 
*	CSE/PMT Driver release tag: 23WW04.5_**550**_MAIN
*	I915 Driver release tag: RHEL86_23WW4.5_**550**_6379.0.25_221103.27
*	Firmware release tag: 23WW04.5_**550**

`Notes: The Intel GPU driver version 550 is highlighted in bold. `

To package the kernel driver modules into driver container image, [ubi-minimal](https://catalog.redhat.com/software/containers/ubi8/ubi-minimal/5c359a62bed8bd75a2c3fba8) is used as the base image. [Using UBI image](https://redhat-connect.gitbook.io/partner-guide-for-red-hat-openshift-and-container/program-on-boarding/containers-with-red-hat-universal-base-image-ubi) as the base image to package software is the requirement for Red Hat Container Certification.
