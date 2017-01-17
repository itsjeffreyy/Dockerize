FROM ubuntu:16.04

MAINTAINER Jeffreyy Chun-Hui Yu

# install the system requirement
RUN \
	apt update --fix-missing \
	&& apt install -q -y wget g++ gcc make bzip2 git autoconf automake make g++ gcc build-essential zlib1g-dev libgsl0-dev  perl curl git wget unzip tabix libncurses5-dev python

WORKDIR /opt

# sambamba installation
# install sambamba needs ldc
RUN \
	wget https://github.com/ldc-developers/ldc/releases/download/v0.17.1/ldc2-0.17.1-linux-x86_64.tar.xz \
	&& tar xJf ldc2-0.17.1-linux-x86_64.tar.xz

ENV PATH=/opt/ldc2-0.17.1-linux-x86_64/bin/:$PATH
ENV LIBRARY_PATH=/opt/ldc2-0.17.1-linux-x86_64/lib/

#install sambamba 
RUN \
	git clone --recursive https://github.com/lomereiter/sambamba.git \
	&& cd /opt/sambamba \
	&& make sambamba-ldmd2-64 

# reduce image size
RUN \
	apt-get autoremove -y \
	&& rm -f /opt/ldc2-0.17.1-linux-x86_64.tar.xz \
	&& rm -rf /var/lib/apt 

#RUN apt remove -q -y wget g++ gcc make bzip2 git autoconf automake make g++ gcc build-essential zlib1g-dev libgsl0-dev  perl curl git wget unzip tabix libncurses5-dev \

# set environment
ENV PATH=/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/opt/sambamba/build/sambamba:$PATH

