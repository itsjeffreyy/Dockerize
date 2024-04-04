# arg
ARG BASE_IMAGE="continuumio/miniconda3:latest"
ARG SOFTWARE="minimap2, samtools"
ARG SOFTWARE_VER="v2.28, v1.19.2"

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
	&& apt-get install -y wget zlib1g man-db wget g++ gcc make bzip2 libncurses5-dev zlib1g-dev git curl make libbz2-dev liblzma-dev autoconf libcurl4-gnutls-dev libssl-dev \
	&& conda update -n base -c defaults conda \
	&& conda config --add channels bioconda \
	&& conda config --add channels conda-forge \
# Install software
	## samtools and minimap2
	&& conda install -y -c bioconda -c conda-forge minimap2=2.28 samtools=1.19.2 \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
# setting
	&& mkdir /input /output

WORKDIR /input
