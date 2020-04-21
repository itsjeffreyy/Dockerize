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
	bzip2 g++ zlib1g-dev libbz2-dev liblzma-dev libffi-dev libncurses5-dev libcurl4-gnutls-dev libssl-dev curl make cmake wget python3-all-dev python-virtualenv \
 	&& apt-get clean \
 	&& apt-get purge \
	&& apt-get autoremove -y \
	# install git-lfs
	&& curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
	&& apt-get update && apt-get install -y git-lfs && git lfs install \
	&& mkdir /output \
	# install medaka
	&& git clone https://github.com/nanoporetech/medaka.git \ 
	&& cd medaka &&	sed -i 's/tensorflow/tensorflow-gpu/' requirements.txt && make install \
	&& echo "source /program/medaka/venv/bin/activate" >> ~/.bashrc

ENV PATH=/program/medaka/venv/bin:$PATH
ENV TF_FORCE_GPU_ALLOW_GROWTH=true

# define a working dir
WORKDIR /input
