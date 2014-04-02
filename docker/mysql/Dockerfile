FROM ubuntu:precise
MAINTAINER Naftuli Tzvi Kay <rfkrocktk@gmail.com>

# Ensure everything is UTF-8, because there's no reason in the world why not.
RUN apt-get update -qq
RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install MariaDB PPA
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
RUN echo 'deb http://ftp.osuosl.org/pub/mariadb/repo/10.0/ubuntu precise main' > /etc/apt/sources.list.d/mariadb.list
RUN apt-get update -qq

# Install MariaDB
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy mariadb-server

# Install MariaDB Configuration
ADD mysql.conf /etc/mysql/my.cnf

# Mount Data Volume
VOLUME["/data"]

# Expose TCP Port 3306
EXPOSE 3306
