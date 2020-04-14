#Base images
FROM python:3.7-slim

#Constants
ARG PYCOQC_VERSION=2.5.0.21

#Setup
RUN python3 -m pip install pysam pycoQC==${PYCOQC_VERSION} \
	&& mkdir /output

WORKDIR /input
