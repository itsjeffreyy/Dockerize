# arg
ARG BASE_IMAGE="ubuntu:16.04"
ARG SOFTWARE="GeneMarkS2"
ARG SOFTWARE_VER="v1.10"

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

COPY gms2/ /opt
WORKDIR /opt

# initiat setting
RUN apt-get update && apt-get upgrade -y \
# environment setting
	&& apt-get install -y wget git \
# Install software
#	&& wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_eWtih/gms2_linux_64.tar.gz \
#	&& wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_eWtih/gm_key_64.gz \
	&& tar zxvf gms2_linux_64.tar.gz \
#	&& gzip -d gm_key_64.gz \
	&& cp gms2_linux_64/gmhmmp2_key $HOME/.gmhmmp2_key \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
	&& rm -rf /opt/*.tar.gz \
# setting
	&& mkdir /input /output

ENV PATH=/opt/gms2_linux_64/:$PATH

WORKDIR /input
