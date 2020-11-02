# ft_services
System Administration and Networking 42 project

It was necessary to deploy a Kubernetes cluster with 7 independent services, each in its own pod. External access only through Load Balancer. Access is open only to nginx, phpmyadmin, wordpress, ftps, grafana.

If the process in the container or the container crashes, pod will restart itself. At the same time, data in databases (mysql and influxdb) should not be lost. DB are stored on the cluster itself using PersistentVolume and PersistentVolumeClaim.

The entire assembly process is carried out in setup.sh
