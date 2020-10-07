# arg
ARG BASE_IMAGE="continuumio/miniconda3"
ARG SOFTWARE="NextStrain"
ARG SOFTWARE_VER="v1.0"

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
	&& apt-get install -y wget make curl gcc zlib1g-dev pkg-config libfreetype6-dev libpng-dev python-matplotlib \
	&& python3 -m pip install --upgrade pip \
# Install software
	&& curl http://data.nextstrain.org/nextstrain.yml --compressed -o nextstrain.yml \
	&& conda env create -f nextstrain.yml \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
	#&& rm /opt/*.tar.gz \
# setting
	&& mkdir /input /output

WORKDIR /input
