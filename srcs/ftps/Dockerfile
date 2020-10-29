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

FROM        alpine:3.7

RUN         apk update

# install
RUN         apk add --no-cache  vsftpd \
                            openssl \
                            openrc

# set password for root
RUN		    echo 'root:root' | chpasswd

# create own ssl key
RUN         openssl req -newkey rsa:2048 \
                    -nodes \
                    -x509 \
                    -days 365 \
                    -keyout /etc/vsftpd/vsftpd.pem \
                    -out /etc/vsftpd/vsftpd.pem \
                    -subj "/C=RU/ST=Tatarstan/L=KAZAN/O=SCHOOL21/OU=QTAMARIL/CN=localhost"

# copy vsftpd config
COPY        srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

# create folder and file for ftp logs
RUN		    mkdir -p /var/log/ftp && touch /var/log/ftp/xferlog

RUN		    rc default

# create test file
RUN         echo "hello world" > /root/test

# set listening port
EXPOSE	    21

# set starting point
ENTRYPOINT	vsftpd /etc/vsftpd/vsftpd.conf
