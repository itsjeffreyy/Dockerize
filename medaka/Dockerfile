# arg
ARG BASE_IMAGE="nvidia/cuda:10.2-cudnn8-devel-ubuntu16.04"
ARG SOFTWARE="medaka"
ARG SOFTWARE_VER="v1.0.3"

# base image
FROM ${BASE_IMAGE}

# maintainer
MAINTAINER Jeffrey C.H. Yu <itsjeffreyy76@gmail.com>

# LABEL
LABEL \
	maintainer="Jeffrey C.H. Yu" \
	email="itsjeffreyy76@gmail.com" \
	base_image=$BASE_IMAGE \
	software=$SOFTWARE \
	software_version=$SOFTWARE_VER 

WORKDIR \opt

# initiat setting
RUN apt-get update && apt-get upgrade -y \
# environment setting
	&& apt-get install -y git apt-utils \
	bzip2 g++ zlib1g-dev libbz2-dev liblzma-dev libffi-dev libncurses5-dev libcurl4-gnutls-dev libssl-dev curl make cmake wget python3-all-dev python-virtualenv python3 python3-pip \
# Install software
	&& python3 -m pip install --upgrade pip \
	# install medaka
	&& python3 -m pip install medaka==1.0.3 \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
# setting
	&& mkdir /input /output

WORKDIR /input
