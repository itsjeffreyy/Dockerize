# base image
FROM python:3.7-slim

MAINTAINER Jeffrey C.H. Yu <itsjeffreyy76@gmail.com>

ARG NANOPOLISH_VER="v0.13.2"

LABEL \
	base_image="python:3.7-slim" \
	software="Nanopolish" \
	software_version="v0.13.2"

WORKDIR /opt

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y wget git gcc g++ make bzip2 zlib1g-dev \
# install nanopolish
	&& git clone --recursive https://github.com/jts/nanopolish.git \
	&& cd nanopolish \
	&& git checkout ${NANOPOLISH_VER} \
	&& make \
# setting
	&& mkdir /input /output \
# purge
	&& apt-get autoremove -y \
	&& apt-get purge

ENV PATH=/opt/nanopolish/bin/:/opt/nanopolish/:$PATH

WORKDIR /input
 
