# base image
FROM r-base:3.6.3

MAINTAINER Jeffrey C.H. Yu <itsjeffreyy76@gmail.com>

LABEL \
	base_image="r-base:3.6.3" \
	software="chromeister" \
	software_version="v0.8.1" 

WORKDIR /opt

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y gcc g++ git wget \
	&& R -e "install.packages('dplyr')" \
	&& wget https://github.com/estebanpw/chromeister/archive/0.8.1.tar.gz \
	&& tar zxvf 0.8.1.tar.gz \
	&& cd chromeister*/src && make all \
	# reduce size
	&& rm -rf /opt/*.tar.gz \
	&& apt-get autoremove -y && apt-get purge -y \
	# setting
	&& mkdir /input /output

ENV PATH=/opt/chromeister-0.8.1/bin:$PATH

WORKDIR /input
