# arg
ARG BASE_IMAGE="continuumio/miniconda3"
ARG SOFTWARE="QUAST"
ARG SOFTWARE_VER="v5.0.2"

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
	&& apt-get install -y wget make gcc zlib1g-dev pkg-config libfreetype6-dev libpng-dev python-matplotlib procps\
	&& python3 -m pip install --upgrade pip \
	&& conda config --add channels bioconda \
	&& conda update --all -y \
# Install software
	&& conda install -c bioconda  python=3 quast=${software_version} \
	&& quast-download-busco && quast-download-gridss && quast-download-silva \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
	#&& rm /opt/*.tar.gz \
# setting
	&& mkdir /input /output

WORKDIR /input
