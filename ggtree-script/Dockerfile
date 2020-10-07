# arg
ARG BASE_IMAGE="r-base:latest"
ARG SOFTWARE="ggtree-script"
ARG SOFTWARE_VER="3.11"

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
COPY phylotree.R /opt

# initiat setting
RUN apt-get update && apt-get upgrade -y \
# Install software
	&& R -e "install.packages(c('ggplot2','BiocManager','tidyr'))" \
	&& R -e "BiocManager::install('ggtree')" \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
# setting
	&& mkdir /input /output

WORKDIR /input
ENTRYPOINT ["Rscript","/opt/phylotree.R"]
