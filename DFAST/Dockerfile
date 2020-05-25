# arg
ARG BASE_IMAGE="continuumio/miniconda3"
ARG SOFTWARE="DFAST"
ARG SOFTWARE_VER="v.1.2.6"

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
	&& apt-get install -y wget \
# Install software
# GeneMarkS2
    && wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_eWtih/gms2_linux_64.tar.gz \
    && wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_eWtih/gm_key_64.gz \
    && tar zxvf gms2_linux_64.tar.gz && gzip -d gm_key_64.gz \
    && cp gms2_linux_64/gmhmmp2_key $HOME/.gmhmmp2_key \
# DFAST
	&& conda update --all \
	&& conda install -y -c bioconda dfast \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
# setting
	&& mkdir /input /output

ENV PATH=/opt/gms2_linux_64/:$PATH
WORKDIR /input
