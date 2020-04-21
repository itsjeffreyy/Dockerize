FROM ubuntu:16.04

MAINTAINER Jeffreyy Chun-Hui Yu

ARG SRATOOLKIT_VER=2.10.4
LABEL \
software="SRAToolKit" \
software.version="2.10.4"

WORKDIR /opt

# install the system requirement
RUN apt-get update --fix-missing \
	&& apt-get autoremove -y \
	&& apt-get purge \
	&& apt-get install -y wget \
# sratoolkit installation
	&& wget -q https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${SRATOOLKIT_VER}/sratoolkit.${SRATOOLKIT_VER}-ubuntu64.tar.gz -O sratoolkit.${SRATOOLKIT_VER}.tar.gz \
    && tar zxvf sratoolkit.${SRATOOLKIT_VER}.tar.gz  \
	&& mv sratoolkit.${SRATOOLKIT_VER}-ubuntu64 sratoolkit.${SRATOOLKIT_VER} \
# reduce image size
	&& rm -f sratoolkit.${SRATOOLKIT_VER}.tar.gz \
	&& rm -rf /var/lib/apt 

COPY user-settings.mkfg /root/.ncbi/

# set environment  
ENV PATH=/opt/sratoolkit.${SRATOOLKIT_VER}/bin/:$PATH

RUN vdb-config --cfg-dir /root/.ncbi/

WORKDIR /output
