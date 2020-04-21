# medaka
FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

# MAINTAINER
MAINTAINER Jeffreyy Chun Hui Yu <itsjeffreyy76@gmail.com> 

# LABELS
LABEL \
base_image="nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04" \
version="1" \
software="medaka image" \
software.version="0.12.1"

WORKDIR /program

# OS environment setting
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y git apt-utils \
	# for medaka
	bzip2 g++ zlib1g-dev libbz2-dev liblzma-dev libffi-dev libncurses5-dev libcurl4-gnutls-dev libssl-dev curl make cmake wget python3-all-dev python-virtualenv \
	# for pomoxis
	gcc-4.9 g++-4.9 zlib1g-dev libncurses5-dev python3-all-dev libhdf5-dev libatlas-base-dev libopenblas-base libopenblas-dev libbz2-dev liblzma-dev libffi-dev make python-virtualenv cmake  wget bzip2 \
 	&& apt-get clean \
 	&& apt-get purge \
	&& apt-get autoremove -y \
	# install git-lfs
	&& curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
	&& apt-get update && apt-get install -y git-lfs && git lfs install \
	&& mkdir /output \
	# install medaka
	&& git clone https://github.com/nanoporetech/medaka.git \ 
	&& cd medaka &&	sed -i 's/tensorflow/tensorflow-gpu/' requirements.txt && make install 

WORKDIR /program
	# install pomoxis
RUN git clone --recursive https://github.com/nanoporetech/pomoxis \
	&& cd pomoxis && make install 

ENV PATH=/program/medaka/venv/bin:/program/pomoxis/venv/bin:$PATH
ENV TF_FORCE_GPU_ALLOW_GROWTH=true

# define a working dir
WORKDIR /input
