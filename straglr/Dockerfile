# arg
ARG BASE_IMAGE="continuumio/miniconda3"
ARG SOFTWARE="straglr"
ARG SOFTWARE_VER="1.4.1"

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

WORKDIR /opt


# initiat setting
RUN apt-get update && apt-get upgrade -y \
# environment setting
# Install software
	&& conda update --all -y \
	&& conda install -y -c default -c conda-forge -c bioconda python>=3.8.13 pysam>=0.14.0 pybedtools>=0.9.0 numpy>=1.22.3 pathos>=0.2.3 scikit-learn>=1.1 scipy>=1.8.0 straglr=1.4.1\
# reduce size
	&& apt-get autoremove -y && apt-get purge -y 

USER 1000:1000
WORKDIR /tmp
