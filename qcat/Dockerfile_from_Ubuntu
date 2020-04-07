#Base image
FROM ubuntu:18.04

#Constants
ARG QCAT_VERSION=1.1.0

#Set Workdir
WORKDIR software

#Preqrequisites
RUN apt-get update \
 && apt-get install -y build-essential \
                       python3-pkg-resources \
		       python3 \
		       python3-pip
RUN pip3 install --upgrade \
                 setuptools \
                 wheel

#Install qcat
RUN python3 -m pip install qcat==${QCAT_VERSION}

#Cleanup
RUN apt-get clean && apt-get autoremove && mkdir /input /output
