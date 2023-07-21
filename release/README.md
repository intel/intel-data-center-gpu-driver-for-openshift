# Intel Data Center GPU Driver for OpenShift Release Information

# Overview
Intel Data Center GPU driver container images for OpenShift are Red Hat certified and published on the [Red Hat Container Catalog](https://catalog.redhat.com/software/containers/intel/intel-data-center-gpu-driver-container/6495ee55c8b2461e35fb8264). These driver container images are designed to be easily managed by the KMM operator, and they follow the naming convention below.

## Naming Convention
The driver container images in this repository use the following naming pattern:
![driver container image naming pattern](/release/driver-name.png)

### DriverVersion 
`x.y.z` versioning pattern is used by the driver version.  
`x`: for architecture change or major feature improvement in the driver from the Intel GPU repository.   
`y`: for hot bug fixes or minor feature improvements in the driver from the Intel GPU repository.  
`z`: for any improvement from this project including building or debugging updates.  
### KernelVersion 
KernelVersion represents the full Red Hat CoreOS* (RHCOS) kernel version.

## Driver Signing
The Intel Data Center GPU drivers in the released container images are signed for secure boot. For more details on enrolling the public key to enable secure boot with RHOCP, please seek support from Red Hat.

# Release Information 
Please refer to the following table to view the detailed release information for each image:

| Image | Intel GPU Driver | Intel GPU Card Supported | RHEL Version | OCP Version |
| ------------- |------------- | ------------------ | ------------- | ------------- |
|[intel-data-center-gpu-driver-container:1.0.0-4.18.0-372.46.1.el8_6.x86_64](https://catalog.redhat.com/software/containers/intel/intel-data-center-gpu-driver-container/6495ee55c8b2461e35fb8264?tag=1.0.0-4.18.0-372.46.1.el8_6.x86_64&push_date=1687547472450) | Version 555 <br />- [PMT](https://github.com/intel-gpu/intel-gpu-pmt-backports/tree/23WW06.5_555_MAIN) <br />- [i915](https://github.com/intel-gpu/intel-gpu-i915-backports/tree/RHEL86_23WW6.5_555_6469.0.3_221221.3) <br />- [Firmware](https://github.com/intel-gpu/intel-gpu-firmware/tree/23WW06.5_555) | - [Intel® Data Center GPU Flex 140](https://www.intel.com/content/www/us/en/products/sku/230020/intel-data-center-gpu-flex-140/specifications.html) <br />- [Intel® Data Center GPU Flex 170](https://www.intel.com/content/www/us/en/products/sku/230019/intel-data-center-gpu-flex-170/specifications.html) | RHEL 8.6 | OCP 4.12.6 <br /> OCP 4.12.7 |

The public key with the signed drivers is distributed [here](/release/dgpu_driver_public_key.der).
