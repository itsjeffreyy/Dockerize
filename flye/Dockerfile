ARG BASE_IMAGE="continuumio/miniconda3"
ARG SOFTWARE="Flye"
ARG SOFTWARE_VER="2.9.6"

FROM ${BASE_IMAGE}

# FROM 之後必須重新宣告，後面才讀得到
ARG SOFTWARE
ARG SOFTWARE_VER

LABEL \
    maintainer="Jeffrey C.H. Yu" \
    email="itsjeffreyy76@gmail.com" \
    software=${SOFTWARE} \
    software_version=${SOFTWARE_VER}

WORKDIR /opt

RUN apt-get update \
    && apt-get install -y --no-install-recommends procps \
    && conda create -y -n flye -c conda-forge -c bioconda flye=${SOFTWARE_VER} \
    && conda clean -a -y \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /input /output

ENV PATH=/opt/conda/envs/flye/bin:$PATH

WORKDIR /input
