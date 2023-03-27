# arg
ARG BASE_IMAGE="continuumio/miniconda3"
ARG SOFTWARE="homopolish"
ARG SOFTWARE_VER="v0.4.1"

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
	&& apt-get install -y wget git procps \
# Install software
	&& conda config --set channel_priority flexible \
	&& conda create -n homopolish -c conda-forge -c bioconda homopolish=0.4.1=pyhdfd78af_1 \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
# setting
	&& mkdir /input /output

WORKDIR /input
