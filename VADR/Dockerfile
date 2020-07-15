# arg
ARG BASE_IMAGE="ubuntu:18.04"
ARG SOFTWARE="VADR"
ARG SOFTWARE_VER="v1.1"

# base image
FROM ${BASE_IMAGE}

# maintainer
MAINTAINER Jeffrey C.H. Yu <itsjeffreyy76@gmail.com>

# LABEL
LABEL \
	maintainer="Jeffrey C.H. Yu" \
	email="itsjeffreyy76@gmail.com" \
	base_image=${BASE_IMAGE} \
	software=${SOFTWARE} \
	software_version=${SOFTWARE_VER} 

WORKDIR \opt

# initiat setting
RUN apt-get update && apt-get upgrade -y \
# environment setting
	&& apt-get install -y wget git perl gcc g++ cmake automake make openssl perl-openssl-defaults libssl-dev zlib1g zlib1g-dev curl unzip libmodule-cpanfile-perl cpanminus build-essential python3 libpython3-all-dev libpython3-dev libpython3-stdlib \
	&& perl -MCPAN -e shell \
	&& perl -MCPAN -e install CPAN \
	&& cpan reload cpan 
RUN cpan install Term::ReadLine \
	&& cpan install YAML \
	&& cpan install File::ShareDir::Install \
	&& cpan install File::Listing \
	&& cpan install Log::Log4perl \
	&& cpan install Test \
	&& cpan install Test::Deep \
	&& cpan install Test::YAML \
	&& cpan install Sub::Uplevel \
	&& cpan install Test::Warn \
	&& cpan install HTTP \
	&& cpan install Inline::C \
	&& cpan install LWP::Simple \
	&& cpan install Net::SSLeay \
	&& cpan install IO::Socket::SSL \
	&& cpan install LWP::Protocol::https 
# Install software
RUN mkdir VADR && cd VADR \
	&& wget https://raw.githubusercontent.com/nawrockie/vadr/master/vadr-install.sh \
	&& bash ./vadr-install.sh linux \
	&& wget -P /opt https://ftp.ncbi.nlm.nih.gov/pub/nawrocki/vadr-models/coronaviridae/CURRENT/vadr-models-corona-1.1-1.tar.gz \
	&& cd /opt && tar zxvf vadr-models-corona-1.1-1.tar.gz \
# reduce size
	&& apt-get autoremove -y && apt-get purge -y \
# setting
	&& mkdir /input /output 
ENV VADRINSTALLDIR="/opt/VADR/"
ENV VADRSCRIPTSDIR="$VADRINSTALLDIR/vadr"
ENV VADRMODELDIR="$VADRINSTALLDIR/vadr-models"
ENV VADRINFERNALDIR="$VADRINSTALLDIR/infernal/binaries"
ENV VADREASELDIR="$VADRINSTALLDIR/infernal/binaries"
ENV VADRHMMERDIR="$VADRINSTALLDIR/hmmer/binaries"
ENV VADRBIOEASELDIR="$VADRINSTALLDIR/Bio-Easel"
ENV VADRSEQUIPDIR="$VADRINSTALLDIR/sequip"
ENV VADRBLASTDIR="$VADRINSTALLDIR/ncbi-blast/bin"
ENV PERL5LIB="$VADRSCRIPTSDIR":"$VADRSEQUIPDIR":"$VADRBIOEASELDIR/blib/lib":"$VADRBIOEASELDIR/blib/arch":"$PERL5LIB"
ENV PATH="$VADRSCRIPTSDIR":"$PATH"

WORKDIR /input
