FROM ubuntu

MAINTAINER Jeffreyy Chun-Hui Yu

RUN apt update --fix-missing \
    && apt install -q -y wget

RUN \
	wget -q https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.8.1/sratoolkit.2.8.1-ubuntu64.tar.gz -O- \
    | tar xz -C /opt/ \
    && mkdir /opt/sratoolkit \
    && ln -s /opt/sratoolkit.2.8.1-ubuntu64/bin/* /opt/sratoolkit/

ENV PATH /bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/opt/sratoolkit/

