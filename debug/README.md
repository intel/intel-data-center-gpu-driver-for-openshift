## Debug Intel dGPU Driver Container Image on OpenShift Cluster 

To debug Intel dGPU driver Container Image, please make sure the OpenShift cluster is provisioned with Intel® Data Center GPU Flex cards available on the cluster nodes. 

`Notes: the following operations are verified on OCP-4.11 and OCP-4.12 cluster with Intel® Data Center GPU Flex 140`

### Debuding driver building 
Firstly, [Red Hat OCP buildconfig](https://docs.openshift.com/container-platform/4.11/cicd/builds/understanding-buildconfigs.html) is used to debug driver building process. The dockerfile section in [driver-build.yaml](driver-build.yaml) can be updated to debug the building and packaging of dGPU Driver Container Image. 

* Using the command below to deploy the buildconfig and start a build process on openShift cluster. 

`$ oc apply –f driver-build.yaml` 

If everything runs smoothly, the image created from the building process will be saved into [Red Hat OpenShift image stream](https://docs.openshift.com/container-platform/4.11/openshift_images/image-streams-manage.html), which can be used to debug the deployment of driver container image on the cluster. 

### Debuging permission
Before that we need to create the proper [service account](https://kubernetes.io/docs/concepts/security/service-accounts/) with the proper permission to deploy and debug the driver container image. Even now the privileged permission is used, the l permission is needed to be found for deploy the driver with less permission. 

* Using the command below to create the service account with [driver-build.yaml](driver-build.yaml)   

`$ oc apply –f driver-build.yaml`

### Debugging driver deployment 
* Now driver [driver-deploy.yaml](driver-deploy.yaml) can be used to deploy and debug the driver container image 

`$ oc apply –f driver-deploy.yaml `

### Debugging the driver
* Below command can be used to log into the driver container to do further debugging work 

`$ oc debug –n  pod/pod_name` 

* Below command can also be used to debug the node where the driver container is running if further debugging on the work node is needed 

`$ oc dbug –n node/node_name` 
