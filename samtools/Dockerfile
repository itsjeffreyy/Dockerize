FROM ubuntu:16.04

MAINTAINER Jeffrey C.H. Yu <itsjeffreyy76@gmail.com>

ARG SAMTOOLS_VER="1.9"

LABEL \
	base_image="ubuntu:16.04" \
	software="SAMTools, bcftools, htslib" \
	software_version="v1.9"

WORKDIR /opt

# install the system requirement
RUN apt-get update --fix-missing && apt-get upgrade -y \
	&& apt-get install -q -y wget g++ gcc make bzip2 libncurses5-dev zlib1g-dev git curl make libbz2-dev liblzma-dev autoconf automake perl libcurl4-gnutls-dev libssl-dev \
# install samtools
	&& curl -LOOO https://github.com/samtools/{samtools/releases/download/1.9/samtools-1.9,bcftools/releases/download/1.9/bcftools-1.9,htslib/releases/download/1.9/htslib-1.9}.tar.bz2 \
	&& cat *tar.bz2 | tar -ijxf - \
	&& cd htslib-1.9 && ./configure && make && make install && cd .. \
	&& cd samtools-1.9 && ./configure  && make && make install && cd .. \
	&& cd bcftools-1.9 && ./configure  && make && make install && cd .. \
	&& mkdir /output /input \
# reduce image size
	&& rm -rf /opt/*.tar.bz2 \
	&& rm -rf /opt/* \
	&& apt-get autoremove -y 

# set environment
#ENV PATH=/opt/samtools-1.9/:/opt/samtools-1.9/misc:$PATH

WORKDIR /input
