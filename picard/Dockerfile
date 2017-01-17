FROM ubuntu:16.04
RUN apt-get update && apt-get install -y --no-install-recommends \
	unzip \
	wget \
	git \
	ca-certificates \
	gcc \
	make \
	build-essential

FROM openjdk:8

MAINTAINER Jeffreyy Chun-Hui Yu

WORKDIR /opt 

#Install PicardTools
RUN wget -q -O picard-2.8.1.tar.gz https://github.com/broadinstitute/picard/archive/2.8.1.tar.gz \
	&& tar zxvf picard-2.8.1.tar.gz \
	&& rm /opt/picard-2.8.1.tar.gz  
ENV PICARD_HOME /opt/picard-tools-2.8.1
