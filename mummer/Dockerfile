# base image
FROM centos:centos7.3.1611

MAINTAINER Jeffrey C.H. Yu <itsjeffreyy76@gmail.com>

# LABEL
LABEL \
	base_image="centos:centos7.3.1611" \
	software="MUMmer" \
	software_version="3.23"

WORKDIR /opt

RUN yum update -y \
	&& yum install -y wget make tcsh perl gcc gnuplot gcc-c++ \
# install MUMmer
	&& wget https://downloads.sourceforge.net/project/mummer/mummer/3.23/MUMmer3.23.tar.gz \
	&& tar zxvf MUMmer3.23.tar.gz && cd MUMmer3.23 \
	&& make install \
	&& perl -i -pe 's/defined \(%/\(%/' mummerplot \
# reduce size
	&& rm -rf /opt/*.tar.gz \
	&& mkdir /input /output

ENV PATH=/opt/MUMmer3.23:$PATH

WORKDIR /input
