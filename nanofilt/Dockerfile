# Base images
FROM python:3.7-slim

# Constants
ARG NANOFILT_VERSION=2.6.0

WORKDIR /input

# setup
RUN python3 -m pip install nanofilt==${NANOFILT_VERSION} \
	&& mkdir /output
