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
	&& apt-get install -y wget git gcc g++ make zlib1g zlib1g-dev \
# Install software via git
#	&& git clone https://github.com/lh3/seqtk.git \
#	&& cd seqtk && make && make install \
# Install software via wget 
	&& wget https://github.com/lh3/seqtk/archive/v1.3.tar.gz \
	&& tar zxvf v1.3.tar.gz && mv -f seqtk-1.3 seqtk \
	&& cd seqtk && make && make install \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
	&& rm -f /opt/*.tar.gz \
# setting
	&& mkdir /input /output

WORKDIR /input
