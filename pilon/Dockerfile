# arg
ARG BASE_IMAGE="ubuntu:16.04"
ARG SOFTWARE="pilon"
ARG SOFTWARE_VER="v1.23"

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
	&& apt-get install -y git wget openjdk-8-jdk openjdk-8-jre python3 tabix samtools bedtools \
# Install software
	&& wget https://github.com/broadinstitute/pilon/releases/download/v1.23/pilon-1.23.jar \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
# setting
	&& mkdir /input /output

WORKDIR /input

ENTRYPOINT ["java","-jar","/opt/pilon-1.23.jar"]
