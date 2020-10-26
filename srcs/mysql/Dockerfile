# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qtamaril <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/26 16:07:03 by qtamaril          #+#    #+#              #
#    Updated: 2020/10/26 16:07:05 by qtamaril         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM        alpine:latest

RUN         apk update

# install
RUN         apk add --no-cache  mysql \
                                mysql-client \
                                openrc

# copy configs and script
COPY        src/my.cnf /etc/mysql/my.cnf
COPY        srcs/start.sh ./start.sh

# create a mount point to work with persistent storage
VOLUME      ["/var/lib"]

# set listening port
EXPOSE      3306

# set starting script
ENTRYPOINT  ./start.sh
