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

FROM alpine:latest

RUN apk update

# install
RUN apk add --no-cache nginx openssl openrc supervisor openssh

# create user and group 'www' for nginx
RUN adduser -D -g 'www' www

# create folders for html
RUN mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www && \
    mkdir /run/nginx

# copy supervisord config
COPY srcs/supervisord.conf /etc/supervisord.conf
# copy nginx config
COPY srcs/server.conf /etc/nginx/conf.d/default.conf
# copy index page
COPY srcs/index.html /var/www/index.html

# create own ssl key
RUN mkdir /etc/nginx/ssl \
&& openssl req -newkey rsa:2048 \
-nodes \
-x509 \
-days 365 \
-out /etc/nginx/ssl/localhost.crt \
-keyout etc/nginx/ssl/localhost.key \
-subj "/C=RU/ST=Tatarstan/L=KAZAN/O=SCHOOL21/OU=QTAMARIL/CN=localhost"

# set listening ports
EXPOSE	80 443 22

CMD ["/usr/bin/supervisord"]
