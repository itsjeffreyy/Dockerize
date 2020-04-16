# build minimap2-coverage
FROM continuumio/anaconda3
### MAINTAINER ###
MAINTAINER Jeffreyy Chun Hui Yu <itsjeffreyy76@gmail.com> 

### LABELS ###
LABEL base_image="anaconda3"
LABEL version="1"
LABEL software="LongQC image"
LABEL software.version="0.3"

RUN apt-get update && \
	apt-get upgrade -y && \
 	apt-get install -y  \
	    git \
	    build-essential \
	    libc6-dev \
	    zlib1g-dev && \
 	apt-get clean && \
 	apt-get purge && \
	cd /opt && \
	git clone https://github.com/yfukasawa/LongQC.git && \
	cd /opt/LongQC/minimap2_mod && \
	make extra && \
	cp /opt/LongQC/minimap2_mod/minimap2-coverage /usr/local/bin/minimap2-coverage && \
	cp /opt/LongQC/minimap2_mod/sdust /usr/local/bin/sdust && \
# install dependency
	conda update conda && \
	conda install -y -c bioconda pysam edlib python-edlib && \
	mkdir /output && \
	chmod 755 /opt/LongQC/*.py

#ENV PATH=/opt/LongQC:/opt/LongQC/minimap2_mod:/opt/LongQC/minimap2_mod/minimap2-coverage:$PATH
# define a working dir
WORKDIR /input
