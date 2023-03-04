## Intel Data Center GPU Driver Container Images For OpenShift Release

* **RepositoryName:Tag** is used to track the released images.

  * **ReposityName:** intel-dgpu-driver-container
  * **Tag:** DriverVersion--KernelVersion
    * **DriverVersion:** X.Y.Z
      * **X:** update for Driver architecture change or major features 
        
        **Example:** 0: Drivers for RHEL8.x  1: Drivers for RHEL9.x
        
      * **Y:** updates for Driver bug fixing or minor features support
      * **Z:** updates for OOT driver CI/CD component or Debug component
    * **KernelVersion:** RHEL/RHCOS full Kernel version
    
        **Example:** 4.18.0-372.40.1.el8_6.x86_64

**Example:** intel-dgpu-driver-container:0.1.0--4.18.0-372.40.1.el8_6.x86_64

Below table is used to track the detailed image release information

### Table-1. Intel Data Center GPU Driver Container Images for OpenShift Release
 
-
    |Intel-dgpu-driver-container|Intel GPU Driver|OpenShift|RHEL|Notes|
    | ------------- |-------------|-------------|-------------|-------------|
    |[0.1.0--4.18.0-372.40.1.el8_6.x86_64]() | 550 | 4.12.0/1/2/3/4/5 |8.6||
