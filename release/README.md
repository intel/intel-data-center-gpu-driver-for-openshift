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
Please refer to the following table to view the detailed release information for each image.

The driver containers released support the following Intel GPUs:  
- [Intel® Data Center GPU Flex 140](https://www.intel.com/content/www/us/en/products/sku/230020/intel-data-center-gpu-flex-140/specifications.html)   
-  [Intel® Data Center GPU Flex 170](https://www.intel.com/content/www/us/en/products/sku/230019/intel-data-center-gpu-flex-170/specifications.html)

| Image | Intel GPU Driver | RHEL Version | OCP Version |
| ------------- |------------- | ------------- | ------------- |
|[intel-data-center-gpu-driver-container:2.1.0-5.14.0-284.50.1.el9_2.x86_64](https://catalog.redhat.com/software/containers/intel/intel-data-center-gpu-driver-container/6495ee55c8b2461e35fb8264?tag=2.1.0-5.14.0-284.50.1.el9_2.x86_64) | Version 682.48 <br />- [i915](https://github.com/intel-gpu/intel-gpu-i915-backports/tree/I915_23WW51.5_682.48_23.6.42_230425.56) <br />- [Firmware](https://github.com/intel-gpu/intel-gpu-firmware/tree/23WW49.5_682.48) | RHEL 9.2 | OCP 4.14.11 |
|[intel-data-center-gpu-driver-container:2.1.0-5.14.0-284.48.1.el9_2.x86_64](https://catalog.redhat.com/software/containers/intel/intel-data-center-gpu-driver-container/6495ee55c8b2461e35fb8264?tag=2.1.0-5.14.0-284.48.1.el9_2.x86_64) | Version 682.48 <br />- [i915](https://github.com/intel-gpu/intel-gpu-i915-backports/tree/I915_23WW51.5_682.48_23.6.42_230425.56) <br />- [Firmware](https://github.com/intel-gpu/intel-gpu-firmware/tree/23WW49.5_682.48) | RHEL 9.2 | OCP 4.14.9 <br /> OCP 4.14.10 |
|[intel-data-center-gpu-driver-container:2.1.0-5.14.0-284.45.1.el9_2.x86_64](https://catalog.redhat.com/software/containers/intel/intel-data-center-gpu-driver-container/6495ee55c8b2461e35fb8264?tag=2.1.0-5.14.0-284.45.1.el9_2.x86_64) | Version 682.48 <br />- [i915](https://github.com/intel-gpu/intel-gpu-i915-backports/tree/I915_23WW51.5_682.48_23.6.42_230425.56) <br />- [Firmware](https://github.com/intel-gpu/intel-gpu-firmware/tree/23WW49.5_682.48) | RHEL 9.2 | OCP 4.14.7 <br /> OCP 4.14.8 |
|[intel-data-center-gpu-driver-container:2.1.0-5.14.0-284.43.1.el9_2.x86_64](https://catalog.redhat.com/software/containers/intel/intel-data-center-gpu-driver-container/6495ee55c8b2461e35fb8264?tag=2.1.0-5.14.0-284.43.1.el9_2.x86_64) | Version 682.48 <br />- [i915](https://github.com/intel-gpu/intel-gpu-i915-backports/tree/I915_23WW51.5_682.48_23.6.42_230425.56) <br />- [Firmware](https://github.com/intel-gpu/intel-gpu-firmware/tree/23WW49.5_682.48) | RHEL 9.2 | OCP 4.14.5 <br /> OCP 4.14.6 |
|[intel-data-center-gpu-driver-container:2.1.0-5.14.0-284.41.1.el9_2.x86_64](https://catalog.redhat.com/software/containers/intel/intel-data-center-gpu-driver-container/6495ee55c8b2461e35fb8264?tag=2.1.0-5.14.0-284.41.1.el9_2.x86_64) | Version 682.48 <br />- [i915](https://github.com/intel-gpu/intel-gpu-i915-backports/tree/I915_23WW51.5_682.48_23.6.42_230425.56) <br />- [Firmware](https://github.com/intel-gpu/intel-gpu-firmware/tree/23WW49.5_682.48) | RHEL 9.2 | OCP 4.14.3 <br /> OCP 4.14.4 |
|[intel-data-center-gpu-driver-container:2.1.0-5.14.0-284.40.1.el9_2.x86_64](https://catalog.redhat.com/software/containers/intel/intel-data-center-gpu-driver-container/6495ee55c8b2461e35fb8264?tag=2.1.0-5.14.0-284.40.1.el9_2.x86_64) | Version 682.48 <br />- [i915](https://github.com/intel-gpu/intel-gpu-i915-backports/tree/I915_23WW51.5_682.48_23.6.42_230425.56) <br />- [Firmware](https://github.com/intel-gpu/intel-gpu-firmware/tree/23WW49.5_682.48) | RHEL 9.2 | OCP 4.14.2 |
|[intel-data-center-gpu-driver-container:2.1.0-5.14.0-284.36.1.el9_2.x86_64](https://catalog.redhat.com/software/containers/intel/intel-data-center-gpu-driver-container/6495ee55c8b2461e35fb8264?tag=2.1.0-5.14.0-284.36.1.el9_2.x86_64) | Version 682.48 <br />- [i915](https://github.com/intel-gpu/intel-gpu-i915-backports/tree/I915_23WW51.5_682.48_23.6.42_230425.56) <br />- [Firmware](https://github.com/intel-gpu/intel-gpu-firmware/tree/23WW49.5_682.48) | RHEL 9.2 | OCP 4.14.0 <br /> OCP 4.14.1 |
|[intel-data-center-gpu-driver-container:2.0.0-5.14.0-284.28.1.el9_2.x86_64](https://catalog.redhat.com/software/containers/intel/intel-data-center-gpu-driver-container/6495ee55c8b2461e35fb8264?tag=2.0.0-5.14.0-284.28.1.el9_2.x86_64) | Version 682.38 <br />- [i915](https://github.com/intel-gpu/intel-gpu-i915-backports/tree/I915_23WW39.5_682.38_23.6.37_230425.49) <br />- [Firmware](https://github.com/intel-gpu/intel-gpu-firmware/tree/23WW39.5_682.38) | RHEL 9.2 | OCP 4.13.10 <br /> OCP 4.13.11 |
|[intel-data-center-gpu-driver-container:1.1.0-4.18.0-372.64.1.el8_6.x86_64](https://catalog.redhat.com/software/containers/intel/intel-data-center-gpu-driver-container/6495ee55c8b2461e35fb8264?tag=1.1.0-4.18.0-372.64.1.el8_6.x86_64) | Version 647 <br />- [PMT](https://github.com/intel-gpu/intel-gpu-pmt-backports/tree/23WW28.5_647.21_MAIN) <br />- [i915](https://github.com/intel-gpu/intel-gpu-i915-backports/tree/RHEL88_23WW28.5_647.21_23.5.19_230406.22) <br />- [Firmware](https://github.com/intel-gpu/intel-gpu-firmware/tree/23WW28.5_647.21) | RHEL 8.6 | OCP 4.12.25 <br /> OCP 4.12.26 <br /> OCP 4.12.27 <br /> OCP 4.12.28 |
|[intel-data-center-gpu-driver-container:1.0.0-4.18.0-372.46.1.el8_6.x86_64](https://catalog.redhat.com/software/containers/intel/intel-data-center-gpu-driver-container/6495ee55c8b2461e35fb8264?tag=1.0.0-4.18.0-372.46.1.el8_6.x86_64&push_date=1687547472450) | Version 555 <br />- [PMT](https://github.com/intel-gpu/intel-gpu-pmt-backports/tree/23WW06.5_555_MAIN) <br />- [i915](https://github.com/intel-gpu/intel-gpu-i915-backports/tree/RHEL86_23WW6.5_555_6469.0.3_221221.3) <br />- [Firmware](https://github.com/intel-gpu/intel-gpu-firmware/tree/23WW06.5_555) | RHEL 8.6 | OCP 4.12.6 <br /> OCP 4.12.7 |

The public key with the signed drivers is distributed [here](/release/dgpu_driver_public_key.der).
