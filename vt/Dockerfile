# Base image ubuntu:16.04
FROM ubuntu:16.04

# Author
MAINTAINER Jeffreyy Chun-Hui Yu

# install the system requirement
RUN \
	apt-get update --fix-missing -yq \
	&& apt-get install -q -y wget g++ gcc make bzip2 git autoconf automake make g++ gcc build-essential zlib1g-dev libgsl0-dev curl git wget unzip tabix libncurses5-dev

WORKDIR /opt

# install samtools and sambamba
RUN \
	git clone https://github.com/atks/vt.git \
	&& cd vt \
	&& make 

ENV PATH=/opt/vt:$PATH

#clean tar balls
RUN \
	rm -rf /var/lib/apt/lists/* \
	&& apt-get autoremove -y 
	

# set path
WORKDIR /root 
