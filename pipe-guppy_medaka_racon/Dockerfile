FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

# install ONT Guppy cpu version
WORKDIR /tmp

ARG DEBIAN_FRONTEND=noninteractive
# according  ONT community https://community.nanoporetech.com/protocols/Guppy-protocol/v/gpb_2003_v1_revp_14dec2018/linux-guppy
RUN \
	apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y apt-utils wget lsb-release apt-transport-https libboost-all-dev libcurl3 libhdf5-dev libhdf5-10 \ 
	                      libhdf5-cpp-11 libzmq5 git libssl-dev curl bzip2 g++ zlib1g-dev libbz2-dev liblzma-dev libffi-dev \
						  libncurses5-dev libcurl4-gnutls-dev wget python3-all-dev python-virtualenv
	&& curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
	&& apt-get update && apt-get install -y git-lfs && git lfs install \
	&& wget -q https://mirror.oxfordnanoportal.com/software/analysis/ont_guppy_3.5.2-1~xenial_amd64.deb \
	&& dpkg -i --ignore-depends=nvidia-384,libcuda1-384 ont_guppy_3.5.2-1~xenial_amd64.deb \
	&& rm -f ont_guppy_3.5.2-1~xenial_amd64.deb \
	&& wget -q https://github.com/Kitware/CMake/releases/download/v3.17.1/cmake-3.17.1.tar.gz \
	&& tar zxvf cmake-3.17.1.tar.gz && cd cmake-3.17.1 \
	&& bootstrap && make && make install && cd .. && rm -rf cmake-3.17.1* \
	&& git clone --recursive https://github.com/lbcb-sci/racon.git racon \
	&& cd racon && mkdir build && cmake -DCMAKE_BUILD_TYPE=Release -Dracon_enable_cuda=ON .. \ 
	&& make install && cd .. && rm -rf racon && cd /\
	&& git clone https://github.com/nanoporetech/medaka.git \ 
	&& cd medaka &&	sed -i 's/tensorflow/tensorflow-gpu/' requirements.txt && make install
	&& apt-get autoremove -y 

WORKDIR /media
