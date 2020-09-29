# arg
ARG BASE_IMAGE="ubuntu:16.04"
ARG SOFTWARE="BUSCO"
ARG SOFTWARE_VER="v4.0.6"

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
	&& apt-get install -y wget git python3 python3-dev \
# install miniconda3
	&& wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /opt/miniconda.sh \
	&& bash /opt/miniconda.sh -b -p /opt/miniconda3 \
	&& /opt/miniconda3/bin/conda update -n base -c defaults conda \
	&& /opt/miniconda3/bin/conda config --add channels  bioconda \
	&& /opt/miniconda3/bin/conda config --add channels  conda-forge\
# Install software
	&& /opt/miniconda3/bin/conda install -y -c bioconda -c conda-forge busco=4.0.6 \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
# setting
	&& mkdir /input /output
ENV PATH=/opt/miniconda3/bin/:$PATH

WORKDIR /input
