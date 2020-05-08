# arg
ARG BASE_IMAGE="ubuntu:16.04"
ARG SOFTWARE="seqtk"
ARG SOFTWARE_VER="v1.3"

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
	&& apt-get install -y wget git gcc g++ make zlib1g zlib1g-dev bzip2 libbz2-dev liblzma-dev \
# Install software
	&& git clone https://github.com/lh3/seqtk.git \
	&& cd seqtk && make && make install \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
# setting
	&& mkdir /input /output

WORKDIR /input
