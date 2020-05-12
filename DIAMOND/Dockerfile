# arg
ARG BASE_IMAGE="ubuntu:16.04"
ARG SOFTWARE="DIAMOND"
ARG SOFTWARE_VER="v0.9.32"

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
	&& apt-get install -y wget zlib1g zlib1g-dev gcc g++ cmake make libpthread-stubs0-dev \
# Install software
	&& wget https://github.com/bbuchfink/diamond/archive/v0.9.32.tar.gz \
	&& tar zxvf v0.9.32.tar.gz && mv diamond-0.9.32 diamond \
	&& mkdir -p diamond/bin/ && cd diamond/bin/ \
	&& cmake .. && make install \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
	&& rm -rf /opt/*.tar.gz \
# setting
	&& mkdir /input /output

WORKDIR /input
