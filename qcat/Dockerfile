#Base images
FROM python:3.8-slim

MAINTAINER Jeffrey C.H. Yu <itsjeffreyy76@gmail.com>

#Constants
ARG QCAT_VERSION=1.1.0

LABEL \
	base_image="python:3.8-slim" \
	software="qcat" \
	software_version="1.1.0"

#Setup
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y \
	&& python3 -m pip install --upgrade setuptools \
	&& python3 -m pip install qcat==${QCAT_VERSION} \
	&& mkdir /output

WORKDIR /input
