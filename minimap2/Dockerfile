# base images
FROM ubuntu:16.04

MAINTAINER Jeffrey C.H. Yu <itsjeffreyy76@gmail.com>

ARG MINIMAP2_VER="v2.17"

LABEL \
	base_image="ubuntu:16.04" \
	software="Minimap2" \
	softeare_version=$MINIMAP2_VER

# set workdir
WORKDIR /opt

# requirment
RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y wget zlib1g man-db wget g++ gcc make bzip2 libncurses5-dev zlib1g-dev git curl make libbz2-dev liblzma-dev autoconf libcurl4-gnutls-dev libssl-dev \
# install samtools
	&& curl -LOOO https://github.com/samtools/{samtools/releases/download/1.9/samtools-1.9,bcftools/releases/download/1.9/bcftools-1.9,htslib/releases/download/1.9/htslib-1.9}.tar.bz2 \
	&& cat *tar.bz2 | tar -ijxf - \
	&& cd htslib-1.9 && ./configure && make && make install && cd .. \
	&& cd samtools-1.9 && ./configure  && make && make install && cd .. \
	&& cd bcftools-1.9 && ./configure  && make && make install && cd .. \
	&& mkdir -p /output /input /reference \
# install minimap2
	&& wget https://github.com/lh3/minimap2/archive/v2.17.tar.gz \
	&& tar zxvf v2.17.tar.gz \
	&& cd minimap2-2.17/ \
	&& make -j 2 \
# reduce image size
	&& rm -f /opt/*.tar.* \
	&& apt-get autoremove -y 

ENV PATH=/opt/minimap2-2.17/:$PATH
WORKDIR /input
