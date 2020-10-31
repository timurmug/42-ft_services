# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qtamaril <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 13:05:39 by qtamaril          #+#    #+#              #
#    Updated: 2020/10/29 13:05:41 by qtamaril         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM        alpine:3.7

RUN         apk update

# install
RUN		    apk add --no-cache ca-certificates

# download lib
RUN		    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN		    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN		    apk add glibc-2.32-r0.apk
RUN		    rm -f glibc-2.32-r0.apk

# download grafana
RUN         wget https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz
RUN         tar -zxvf grafana-7.1.5.linux-amd64.tar.gz
RUN         rm -f grafana-7.1.5.linux-amd64.tar.gz

# copy grafana db
COPY        srcs/grafana.db /grafana-7.1.5/data/grafana.db

# set listening port
EXPOSE      3000

WORKDIR     /grafana-7.1.5/bin/

ENTRYPOINT  ./grafana-server
