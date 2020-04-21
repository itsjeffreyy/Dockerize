# base images
FROM ubuntu:18.04

# set workdir
WORKDIR /program

# requirment
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y wget git gcc g++ make zlib1g zlib1g-dev man-db \
	&& apt-get autoremove -y \
	&& mkdir -p /output /input /reference \
	&& wget https://github.com/lh3/minimap2/archive/v2.17.tar.gz \
	&& tar zxvf v2.17.tar.gz \
	&& rm -f v2.17.tar.gz \
	&& cd minimap2-2.17/ \
	&& make -j \
	&& ln -s /program/minimap2-2.17/minimap2.1 ~/minimap2

ENV PATH=/program/minimap2-2.17/:$PATH
WORKDIR /input
