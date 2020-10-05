# arg
ARG BASE_IMAGE="continuumio/miniconda3"
ARG SOFTWARE="DFAST"
ARG SOFTWARE_VER="v.1.2.10"

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
	&& apt-get install -y wget procps \
	&& conda update -c defaults -y conda \
	&& conda config --add channels bioconda \
# Install software
# GeneMarkS2
    && tar zxvf gms2_linux_64.tar.gz \
	#&& gzip -d gm_key_64.gz \
    && cp gms2_linux_64/gmhmmp2_key $HOME/.gmhmmp2_key \
# DFAST
	&& conda install -y -c bioconda dfast=1.2.10 \
# database
	&& dfast_file_downloader.py --protein dfast --cdd Cog --hmm TIGR \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
# setting
	&& mkdir /input /output
	

ENV PATH=/opt/gms2_linux_64/:$PATH
WORKDIR /input
