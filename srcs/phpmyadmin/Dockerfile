# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qtamaril <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/23 13:01:57 by qtamaril          #+#    #+#              #
#    Updated: 2020/10/23 13:01:59 by qtamaril         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk update

# install
RUN		apk add supervisor \
			nginx \
			openrc \
			php7 php7-fpm php7-iconv php7-json php7-mbstring php7-mysqli php7-phar php7-session

# start the php-fpm7 server
RUN		rc-update add php-fpm7 default

# create folders
RUN		mkdir /run/nginx /var/run/php
RUN		mkdir -p /var/www/phpmyadmin /var/www/phpmyadmin/tmp
RUN		chmod 777 /var/www/phpmyadmin/tmp

# download phpMyAdmin 
RUN		wget -c https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.xz
RUN		tar -xvf phpMyAdmin-latest-english.tar.xz --strip-components 1 -C /var/www/phpmyadmin
RUN		rm -f phpMyAdmin-latest-english.tar.xz

# copy nginx, supervisor, php configs
COPY	srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY	srcs/supervisord.conf /etc/supervisord.conf
COPY	srcs/config.inc.php /var/www/phpmyadmin/config.inc.php

# set listening port
EXPOSE	5000

# start supervisor
CMD		["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]