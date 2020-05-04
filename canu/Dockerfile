# base image
FROM ubuntu:16.04

MAINTAINER Jeffrey C.H. Yu <itsjeffreyy76@gmail.com>

ARG CANU_VER="v2.0"

LABEL \
	base_image="ubuntu:16.04" \
	software="Canu" \
	software_version=${CANU_VER}

WORKDIR /opt

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y git wget make g++ openjdk-8-jdk openjdk-8-jre \
	&&  wget https://github.com/marbl/canu/archive/${CANU_VER}.tar.gz \
	&& tar zxvf ${CANU_VER}.tar.gz && cd canu*/src \
	&& make -j 2 \
	&& mkdir /input /output \
	&& apt-get autoremove -y && apt-get purge 

ENV PATH=/opt/canu-2.0/Linux-amd64/bin:$PATH

WORKDIR /input
