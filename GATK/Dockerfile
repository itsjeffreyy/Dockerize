FROM ubuntu:16.04

MAINTAINER Jeffreyy Chun-Hui Yu

RUN \
	apt-get update -yq --fix-missing \
	&& apt-get install -yq r-base git fuse ca-certificates curl default-jre build-essential zlib1g-dev libncurses5-dev wget maven

#wget g++ gcc make bzip2 git autoconf automake make g++ gcc build-essential zlib1g-dev libgsl0-dev  perl curl git wget unzip tabix libncurses5-dev python

WORKDIR /opt 

# GATK installation
RUN mkdir GATK

COPY GenomeAnalysisTK-3.7.tar.bz2 gatk.tar.bz2

RUN \
	tar jxf gatk.tar.bz2 -C GATK 

# clean tar balls
RUN \
	apt-get autoremove -y \
	&& rm -f /opt/gatk.tar.bz2 \
	&& rm -rf /var/lib/apt

# set evironment pathway
ENV PATH=/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:$PATH

ENTRYPOINT ["java", "-jar", "/opt/GATK/GenomeAnalysisTK.jar"]

