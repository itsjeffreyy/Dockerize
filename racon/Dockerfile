# base image
FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

MAINTAINER Jeffrey C.H. Yu <itsjeffreyy76@gmail.com>

ARG RACON_VER="v1.4.15"
ARG CMAKE_VER="3.17.1"

LABEL \
	base_image="nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04" \
	software="racon" \
	software_version="v1.4.15"

WORKDIR /opt
# eviroment setting
RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y wget git gcc g++ cmake git openssl libssh-dev curl \
# install cmake
    && wget -q https://github.com/Kitware/CMake/releases/download/v3.17.1/cmake-3.17.1.tar.gz \
    && tar zxvf cmake-3.17.1.tar.gz && cd cmake-3.17.1 \
    && ./bootstrap && make -j 2 && make install \
	&& cd /opt \
# install racon
	&& git clone --recursive https://github.com/lbcb-sci/racon.git racon \
	&& cd racon \
	&& mkdir build \
	&& cd build \
	&& cmake -Dracon_build_tests=ON -Dracon_build_wrapper=ON -DCMAKE_BUILD_TYPE=Release -Dracon_enable_cuda=ON .. \
	&& make -j 2 && make install \
# purge
	&& rm -fr /opt/racon /opt/cmake-3.17.1* \
	&& apt-get autoremove -y \
	&& apt-get purge \
# setting
	&& mkdir /output /input

WORKDIR /input
