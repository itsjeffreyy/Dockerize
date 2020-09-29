# arg
ARG BASE_IMAGE="continuumio/miniconda3"
ARG SOFTWARE="Canu"
ARG SOFTWARE_VER="v2.0"

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
	&& apt-get install -y wget git \
	&& conda update conda \
	&& conda update --update-all \
# Install software
	&& conda install -c conda-forge -c bioconda -c defaults canu \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
# setting
	&& mkdir /input /output

WORKDIR /input
