# arg
ARG BASE_IMAGE="continuumio/miniconda3:latest"
ARG SOFTWARE="sambamba"
ARG SOFTWARE_VER="0.71"

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
	&& apt-get install -q -y wget g++ gcc make bzip2 libncurses5-dev zlib1g-dev git curl make libbz2-dev liblzma-dev autoconf automake perl libcurl4-gnutls-dev libssl-dev ldc procps python3 \
	&& conda update --all -y \
# Install software
## samtools
## sambamba
	&& conda install -c bioconda -y sambamba \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
# setting
	&& mkdir /input /output

WORKDIR /input
