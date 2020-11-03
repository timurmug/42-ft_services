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
| Start minikube and create cluster | minikube start |
| Start minikube and create cluster on vm | minikube start --vm-driver=virtualbox |
| Delete minikube | minikube delete |
| Get all worker nodes/pods/services/deploys | kubectl get nodes/pods/svc/deploy |
| Go inside the cluster | minikube ssh |
| Switch docker to work inside the cluster | eval $(minikube docker-env) |
| Activate the specified addon | minikube addons enable "name" |
| Apply the specified k8s setting in the file "file.yaml" | kubectl apply -f file.yaml |
| Remove smth | kubectl delete pod/deploy/svc "name" | 
| See logs of pod| kubectl logs "podname" |
| See pod/svc/deploy info | kubectl describe pod/svc/deploy "name" |
| Kill process "nginx" on "nginxpod" | kubectl exec "nginxpod" -- pkill nginx |

</br>

## Useful links

| Section | Link |
| --- | --- |
| Dockerfile | https://habr.com/ru/company/ruvds/blog/439980/ |
| Alpine | https://wiki.alpinelinux.org/wiki/Tutorials_and_Howtos |
| Kubernetes | https://kubernetes.io/docs/home/ |
| Minikube | https://minikube.sigs.k8s.io/docs/start/ https://kubernetes.io/ru/docs/tutorials/hello-minikube/ |
| Metallb | https://metallb.universe.tf/ |
| k8s objects | https://kubernetes.io/ru/docs/concepts/overview/working-with-objects/kubernetes-objects/ |
| Nodes | https://kubernetes.io/ru/docs/tutorials/kubernetes-basics/explore/explore-intro/ |
| Pods | https://kubernetes.io/docs/concepts/workloads/pods/ |
| Deployments | https://kubernetes.io/docs/concepts/workloads/controllers/deployment/ |
| Services | https://kubernetes.io/docs/concepts/services-networking/service/ |
| Load Balancer | https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/ |
| PersistentVolume | https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume |
| PersistentVolumeClaim | https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolumeclaim |
| Deploying WordPress and MySQL with Persistent Volumes | https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/ |
