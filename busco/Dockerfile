# arg
ARG BASE_IMAGE="continuumio/miniconda3"
ARG SOFTWARE="BUSCO"
ARG SOFTWARE_VER="4.1.4"

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
	&& conda update -n base -c defaults conda \
	&& conda config --add channels bioconda \
	&& conda config --add channels conda-forge \
# Install software
	&& conda install -y -c bioconda -c conda-forge busco=${SOFTWARE_VER} \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
# setting
	&& mkdir /input /output

WORKDIR /input
