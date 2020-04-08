#Base images
FROM python:3.7-slim

#Constants
ARG NANOPLOT_VERSION=1.29.0

WORKDIR /input

#Preqrequisites
RUN apt-get update && apt-get install -y make \
                                         gcc \
					 libbz2-dev \
					 liblzma-dev \
					 wget \
					 libz-dev

#miniconda
#RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
#	&& bash ./Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda \
#	&& $HOME/miniconda/bin/conda install -c plotly plotly-orca \
#	&& rm Miniconda3-latest-Linux-x86_64.sh

#Setup
RUN python3 -m pip install psutil requests plotly nanoplot==${NANOPLOT_VERSION} \
	&& mkdir /output

