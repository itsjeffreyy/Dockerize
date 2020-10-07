# arg
ARG BASE_IMAGE="nvidia/cuda:10.2-cudnn8-devel-ubuntu18.04"
ARG SOFTWARE="medaka"
ARG SOFTWARE_VER="v1.0.3"

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

WORKDIR /opt

# initiat setting
RUN apt-get update && apt-get upgrade -y \
# environment setting
	&& apt-get install -y git apt-utils \
	bzip2 g++ zlib1g-dev libbz2-dev liblzma-dev libffi-dev libncurses5-dev libcurl4-gnutls-dev libssl-dev curl make cmake wget python3-all-dev python-virtualenv python3 python3-pip gcc liblzma-dev autoconf procps \
	&& python3 -m pip install --upgrade pip setuptools six \
# Install software
	## samtools
	&& curl -LOOO https://github.com/samtools/{samtools/releases/download/1.10/samtools-1.10,bcftools/releases/download/1.10.2/bcftools-1.10.2,htslib/releases/download/1.10.2/htslib-1.10.2}.tar.bz2 \
	&& cat *tar.bz2 | tar -ijxf - \
	&& cd htslib-1.10.2 && ./configure && make && make install && cd .. \
	&& cd samtools-1.10 && ./configure  && make && make install && cd .. \
	&& cd bcftools-1.10.2 && ./configure  && make && make install && cd .. \
	## minimap2
	&& wget https://github.com/lh3/minimap2/archive/v2.17.tar.gz \
	&& tar zxvf v2.17.tar.gz \
	&& cd minimap2-2.17/ \
	&& make -j 2 && cd .. \
	# install medaka
	&& python3 -m pip install medaka==1.0.3 \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
	&& rm -f /opt/*.tar.* \
# setting
	&& mkdir /input /output

ENV PATH=/opt/minimap2-2.17/:$PATH
WORKDIR /input
