FROM ubuntu

MAINTAINER Jeffreyy Chun-Hui Yu

WORKDIR /opt

RUN \
  apt update --fix-missing \
  && apt install -q -y wget g++ gcc make bzip2 git autoconf automake make g++ gcc build-essential zlib1g-dev libgsl0-dev  perl curl git wget unzip tabix libncurses5-dev

RUN \
  wget https://github.com/ldc-developers/ldc/releases/download/v0.17.1/ldc2-0.17.1-linux-x86_64.tar.xz \
  && tar xJf ldc2-0.17.1-linux-x86_64.tar.xz

ENV PATH=/opt/ldc2-0.17.1-linux-x86_64/bin/:$PATH
ENV LIBRARY_PATH=/opt/ldc2-0.17.1-linux-x86_64/lib/


RUN \
  git clone --recursive https://github.com/lomereiter/sambamba.git \
  && cd sambamba \
  && make sambamba-ldmd2-64 


RUN apt remove -q -y wget g++ gcc make bzip2 git autoconf automake make g++ gcc build-essential zlib1g-dev libgsl0-dev  perl curl git wget unzip tabix libncurses5-dev
    && apt autoremove -y \

ENV PATH /bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/opt/samtools/:/opt/sambamba/build/sambamba
