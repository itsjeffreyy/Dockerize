# arg
ARG BASE_IMAGE="continuumio/miniconda3"
ARG SOFTWARE="Flye"
ARG SOFTWARE_VER="v2.8.1"

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
	&& apt-get install -y procps \
	&& conda config --add channels bioconda \
	&& conda update --all -y \
# Install software
	&& conda install -c bioconda flye=${software_version} \
# reduce size
	&& apt-get autoremove -y \
# setting
	&& mkdir /input /output

WORKDIR /input
