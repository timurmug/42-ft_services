# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qtamaril <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/27 10:51:05 by qtamaril          #+#    #+#              #
#    Updated: 2020/10/27 10:51:09 by qtamaril         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM        alpine:latest

RUN         apk update

# install
RUN         apk add --no-cache  openrc nginx supervisor \
                                mysql mysql-client \
				                php7 php7-fpm php7-json php7-mysqli

# start the php-fpm7 server
RUN		    rc-update add php-fpm7 default

# create folders
RUN		    mkdir -p /run/nginx
RUN		    mkdir -p /var/run/php

# download wordpress
RUN		    wget https://wordpress.org/latest.tar.gz
RUN		    tar -xf latest.tar.gz
RUN		    mv wordpress /var/www/wordpress
RUN		    rm -rf latest.tar.gz

# copy configs
COPY	    srcs/wordpress.conf		/etc/nginx/conf.d/wordpress.conf
COPY	    srcs/supervisord.conf	/etc/supervisord.conf

# set listening port
EXPOSE      5050

# start supervisor
CMD         ["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

