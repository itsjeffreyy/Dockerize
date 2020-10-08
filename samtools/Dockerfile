# arg
ARG BASE_IMAGE="ubuntu:18.04"
ARG SOFTWARE="samtools, bcftools, htslib"
ARG SOFTWARE_VER="1.11"

# base image
FROM ${BASE_IMAGE}

# maintainer
MAINTAINER Jeffrey C.H. Yu <itsjeffreyy76@gmail.com>

# LABEL
LABEL \
	maintainer="Jeffrey C.H. Yu" \
	email="itsjeffreyy76@gmail.com" \
	base_image=${BASE_IMAGE} \
	software=${SOFTWARE} \
	software_version=${SOFTWARE_VER} 

WORKDIR \opt

# initiat setting
RUN apt-get update && apt-get upgrade -y \
# environment setting
	&& apt-get install -q -y wget g++ gcc make bzip2 libncurses5-dev zlib1g-dev git curl make libbz2-dev liblzma-dev autoconf automake perl libcurl4-gnutls-dev libssl-dev \
# Install software
	&& curl -LOOO https://github.com/samtools/{samtools/releases/download/1.11/samtools-1.11,bcftools/releases/download/1.11/bcftools-1.11,htslib/releases/download/1.11/htslib-1.11}.tar.bz2 \
	&& cat *tar.bz2 | tar -ijxf - \
	&& cd htslib-1.11 && ./configure && make && make install && cd .. \
	&& cd samtools-1.11 && ./configure  && make && make install && cd .. \
	&& cd bcftools-1.11 && ./configure  && make && make install && cd .. \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
	&& rm -rf /opt/*.tar.bz2 \
# setting
	&& mkdir /input /output

WORKDIR /input
