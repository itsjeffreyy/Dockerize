#Base images
FROM python:3.8-slim

#Constants
ARG QCAT_VERSION=1.1.0

#Setup
RUN python3 -m pip install qcat==${QCAT_VERSION} \
	&& mkdir /output

WORKDIR /input
