# Disclaimer 
This project is currently under active development, and as such, all source code may not be included in any release. This means that the code is subject to change without notice, and that any information contained within the code should be considered as work in progress. 

# INTEL® Data Center GPU Driver for OpenShift* 

## General

**Intel Data Center GPU Driver for OpenShift project** is used to build, package, certify and release Intel data center GPU driver container images for [Red Hat OpenShift Container Platform (OCP)](https://www.redhat.com/en/technologies/cloud-computing/openshift/container-platform). Users can make use of the pre-built images to provision Intel® Data Center GPU cards on OCP. They can also use [Intel data center GPU driver Dockerfile](docker/intel-dgpu-driver.Dockerfile) released from this project as a reference to on-premise build the driver container images and provision the GPU cards. Currently, [Intel® Data Center GPU Flex Series](https://www.intel.com/content/www/us/en/products/docs/discrete-gpus/data-center-gpu/flex-series/overview.html) are supported. [Intel® Data Center GPU Max Series](https://www.intel.com/content/www/us/en/products/details/discrete-gpus/data-center-gpu/max-series.html) support is planned in a future release.

Intel data center GPU driver container image is built from [Intel GPU Driver Repository](https://github.com/intel-gpu). It includes:
-	[Intel® Graphics (i915) Driver Backports for Linux for RHEL](https://github.com/intel-gpu/intel-gpu-i915-backports/tree/redhat/main)
-	[Intel® Converged Security Engine (CSE) Backports](https://github.com/intel-gpu/intel-gpu-cse-backports/tree/main)
-	[Intel® Platform Monitoring Technology (PMT) Backports](https://github.com/intel-gpu/intel-gpu-pmt-backports/tree/main)
-	[Intel® GPU firmware](https://github.com/intel-gpu/intel-gpu-firmware)


To build Intel Data Center GPU driver images and provision the GPU cards on OCP, two scenarios have to be supported.

- **Driver Upgrade Scenario** - There is a new release from Intel GPU Drivers. In this scenario, Intel data center GPU driver Dockerfile needs to be updated to include the new release, Intel data center driver container image will be built and packaged from the Dockerfile. After testing and certifying steps, the new image should be released on Red Hat Ecosystem Catalog.    
- **Kernel Upgrade Scenario** - [Red Hat Enterprise Linux CoreOS (RHCOS)](https://docs.openshift.com/container-platform/4.12/architecture/architecture-rhcos.html) kernel is upgraded in a new OCP release.In this scenario the new data center GPU driver container image should be built to match the new kernel version with the Dockerfile creating the previous image.And the new image also need to be tested, certified and then released on Red Hat Ecoystem Catalog  

## Working With Kernel Module Manager (KMM) Operator on OCP
[KMM operator](https://github.com/rh-ecosystem-edge/kernel-module-management) is supported from OCP-4.12. Users can leverage it to deploy and manage Intel data center GPU driver container images released from this project.

[Pre-build mode](https://github.com/intel/intel-technology-enabling-for-openshift/tree/main/kmmo#managing-intel-dgpu-driver-with-kmm-operator) is the main usage mode suggested from [Intel Technology Enabling Project](https://github.com/intel/intel-technology-enabling-for-openshift).

If users want to build the tailored driver container images, [on-premise build mode](https://github.com/intel/intel-technology-enabling-for-openshift/tree/main/kmmo#using-on-premise-build-mode) can be used to build the images on users’ clusters environment. 

## [Intel Data Center GPU Driver Dockerfile Introduction](docker/README.md)

## [Debug Intel Data Center GPU Driver on OCP](debug/README.md)

# Contribute
See [CONTRIBUTING](/CONTRIBUTING.md) for more information.

# License
Distributed under the open source license. See [LICENSE](/LICENSE.txt) for more information.

# Security
To report a potential security vulnerability, please refer to [security.md](/security.md) file.

# Code of Conduct
Intel has adopted the Contributor Covenant as the Code of Conduct for all of its open source projects. See [CODE_OF_CONDUCT](/CODE_OF_CONDUCT.md) file.