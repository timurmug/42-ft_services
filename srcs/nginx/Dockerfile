# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qtamaril <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/19 12:04:45 by qtamaril          #+#    #+#              #
#    Updated: 2020/10/19 12:04:48 by qtamaril         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    alpine:latest

RUN     apk update

# install
RUN     apk add --no-cache  nginx \
                        openssl \
                        supervisor \
                        openssh

# generate host keygen and create ssh user
RUN     ssh-keygen -A
RUN     adduser -D qtamaril && echo "qtamaril:qtamaril" | chpasswd 

# create user and group 'www' for nginx
RUN     adduser -D -g 'www' www

# create folders for html
RUN     mkdir /www && \
        chown -R www:www /var/lib/nginx && \
        chown -R www:www /www && \
        mkdir /run/nginx

# copy supervisor, nginx configs and index page
COPY    srcs/supervisord.conf /etc/supervisord.conf
COPY    srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY    srcs/index.html /var/www/index.html

# create own ssl key
RUN     mkdir /etc/nginx/ssl \
        && openssl req  -newkey rsa:2048 \
                        -nodes \
                        -x509 \
                        -days 365 \
                        -out /etc/nginx/ssl/localhost.crt \
                        -keyout etc/nginx/ssl/localhost.key \
                        -subj "/C=RU/ST=Tatarstan/L=KAZAN/O=SCHOOL21/OU=QTAMARIL/CN=localhost"

# set listening ports
EXPOSE  22 80 443

# start supervisor
CMD     ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]