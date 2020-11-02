# ft_services
#### System Administration and Networking 42 project

It was necessary to deploy a Kubernetes cluster with 7 independent services, each in its own pod. External access only through Load Balancer. Access is open only to nginx, phpmyadmin, wordpress, ftps, grafana.

If the process in the container or the container crashes, pod will restart itself. At the same time, data in databases (mysql and influxdb) should not be lost. DB are stored on the cluster itself using PersistentVolume and PersistentVolumeClaim.

The entire assembly process is carried out in setup.sh

</br>

## Minikube usage

Minikube is a tool for running a single-node Kubernetes cluster in a virtual machine on a personal computer.

| Description | Command |
| --- | --- |
| start minikube and create cluster | minikube start |
| start minikube and create cluster on vm | minikube start --vm-driver=virtualbox |
| delete minikube | minikube delete |
| get all worker nodes/pods/services/deploys | kubectl get nodes/pods/svc/deploy |
| go inside the cluster | minikube ssh |
| switch docker to work inside the cluster | eval $(minikube docker-env) |
| activate the specified addon | minikube addons enable "name" |
| apply the specified k8s setting in the file "file.yaml" | kubectl apply -f file.yaml |
| remove smth | kubectl delete pod/deploy/svc "name" | 
| see logs of pod| kubectl logs "podname" |
| see pod/svc/deploy info | kubectl describe pod/svc/deploy "name" |
| kill process "nginx" on "nginxpod" | kubectl exec "nginxpod" -- pkill nginx |

</br>

## Useful links

| Section | Link |
| --- | --- |
| Dockerfile | https://habr.com/ru/company/ruvds/blog/439980/ |
| Alpine | https://wiki.alpinelinux.org/wiki/Tutorials_and_Howtos |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
