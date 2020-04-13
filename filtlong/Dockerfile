# Base images
FROM ubuntu:18.04

MAINTAINER Jeffreyy C.H. Yu <itsjeffreyy76@gmail.com>

WORKDIR /input

# constants
ARG FILTLONG=v0.2.0

#Prerequisites
RUN apt-get update \
	&& apt-get install -y make \
		gcc \
		g++ \
		zlib1g \
		zlib1g-dev \
		git \
	&& git clone https://github.com/rrwick/Filtlong.git \
	&& cd Filtlong \
	&& make -j \
	&& cp bin/filtlong /usr/local/bin \
	&& cd .. \
	&& rm -r Filtlong \
	&& mkdir /outout
