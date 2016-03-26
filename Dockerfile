# Postgresql (http://www.postgresql.org/)

# Use phusion/baseimage as base image
FROM phusion/baseimage:0.9.18
MAINTAINER Alejandro Guerra <aguerrave@gmail.com>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...

## Fix locale.
locale-gen es_VE.UTF-8
update-locale LANG=es_VE.UTF-8 LC_CTYPE=es_VE.UTF-8 LANGUAGE=es_VE:es LC_ALL=es_VE.UTF-8
echo -n es_VE.UTF-8 > /etc/container_environment/LANG
echo -n es_VE.UTF-8 > /etc/container_environment/LC_CTYPE
echo -n es_VE:es > /etc/container_environment/LANGUAGE
echo -n es_VE.UTF-8 > /etc/container_environment/LC_ALL

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
