## Intel Data Center GPU Driver Container Images For OpenShift Release
### General
Intel data center GPU driver container images are certified and released on the [Red Hat Ecosystem catalog](https://catalog.redhat.com/). To make the driver container images managed by KMM operator easy to use and track, the following naming convention is adopted.

* **RepositoryName:Tag** image naming pattern
  * **RepositoryName:** intel-data-center-gpu-driver-container
  * **Tag:** DriverVersion--KernelVersion
    * **DriverVersion:** X.Y.Z
      * **X:** update for driver architecture or major feature change
        
        **Example:** 0: drivers for RHEL8.x , 1: drivers for RHEL9.x
      * **Y:** updates for driver bug fixing or minor feature support
      * **Z:** updates for building or debugging module change in this project
    * **KernelVersion:** RHCOS full Kernel version
        
        **Example:** 4.18.0-372.40.1.el8_6.x86_64

**Example:** intel-data-center-gpu-driver-container:0.1.0--4.18.0-372.40.1.el8_6.x86_64

The following table can be used to track the detailed image release information:

### Table-1. Intel Data Center GPU Driver Container Images for OpenShift Release

`Note: The image release process is in progress and the current information in the table is only an example`

-
    |Intel-data-center-gpu-driver-container|Intel GPU Driver|OpenShift|RHEL|Notes|
    | ------------- |-------------|-------------|-------------|-------------|
    |[0.1.0--4.18.0-372.40.1.el8_6.x86_64]() | 550 | 4.12.0/1/2/3/4/5 |8.6||
