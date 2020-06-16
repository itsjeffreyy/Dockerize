# arg
ARG BASE_IMAGE="python:3.8-slim"
ARG SOFTWARE="RagTag"
ARG SOFTWARE_VER="v1.0.0"

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
	&& apt-get install -y git wget zlib1g man-db wget g++ gcc make bzip2 libncurses5-dev zlib1g-dev git curl make libbz2-dev liblzma-dev autoconf libcurl4-gnutls-dev libssl-dev \
	&& python3 -m pip install numpy intervaltree pysam \
# Install software
# install samtools
	&& curl -LOOO https://github.com/samtools/{samtools/releases/download/1.9/samtools-1.9,bcftools/releases/download/1.9/bcftools-1.9,htslib/releases/download/1.9/htslib-1.9}.tar.bz2 \
	&& cat *tar.bz2 | tar -ijxf - \
	&& cd htslib-1.9 && ./configure && make && make install && cd .. \
	&& cd samtools-1.9 && ./configure  && make && make install && cd .. \
	&& cd bcftools-1.9 && ./configure  && make && make install && cd .. \
# install minimap2
	&& wget https://github.com/lh3/minimap2/archive/v2.17.tar.gz \
	&& tar zxvf v2.17.tar.gz \
	&& cd minimap2-2.17/ \
	&& make -j 2 \
# install ragtag
	&& cd /opt \
	&& git clone https://github.com/malonge/RagTag.git \
	&& cd RagTag && python3 setup.py install \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
	&& rm -f /opt/*.tar.* \
# setting
	&& mkdir /input /output /ref

ENV PATH=/opt/minimap2-2.17/:$PATH
WORKDIR /input
