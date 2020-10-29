# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qtamaril <qtamaril@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/19 10:16:54 by qtamaril          #+#    #+#              #
#    Updated: 2020/10/19 10:17:06 by qtamaril         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

services=("nginx" "phpmyadmin" "mysql" "wordpress" "ftps")
green_bold="\n\t\t\e[92m\e[1m"
yellow="\e[93m"
default="\e[39m\e[0m\n"
blue="\e[24m: \e[96m"
underline="\e[4m"

printf "${green_bold}Starting minikube and creating cluster on virtualbox${default}"
# minikube delete
# minikube update-context
minikube start --vm-driver=virtualbox
ssh-keygen -f "/Users/qtamaril/.ssh/known_hosts" -R 192.168.99.101
eval $(minikube docker-env)

minikube addons enable metallb
kubectl apply -f srcs/yaml_files/metallb.yaml

for service in "${services[@]}"
do
printf "${green_bold}\tBuilding ${service} image...${default}"
docker build -t "${service}" srcs/${service}
printf "${yellow}${service} image builded!${default}"
done

printf "${green_bold}Creating a volumes for storage...${default}${yellow}"
kubectl apply -f srcs/yaml_files/volumes.yaml

printf "${default}${green_bold}Creating pods based on images with yaml files...${default}${yellow}"
for service in "${services[@]}"
do
kubectl apply -f srcs/yaml_files/${service}.yaml
done

printf "${default}Ip address nginx${blue}192.168.99.101:443${default}"
printf "Ip address phpmyadmin${blue}192.168.99.102:5000${default}"
printf "Mysql hostname${blue}mysql-svc:3306${default}"
printf "Ip address wordpress${blue}192.168.99.103:5050${default}"
printf "Ip address ftps${blue}192.168.99.104:21${default}"
