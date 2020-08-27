FROM ddeswart/codestream-ci:latest
LABEL maintainer="ddeswart@vmware.com"

WORKDIR /tmp

ENV PACKER_VER=v1.6.1

# Install jq
RUN     yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
        yum install jq -y

RUN     wget -q https://releases.hashicorp.com/packer/1.6.1/packer_1.6.1_linux_amd64.zip && \
        unzip packer_1.6.1_linux_amd64.zip && \
        mv -f packer /usr/local/bin/

#Cleanup image tmp dir
RUN rm -rf /tmp/*

ADD VERSION .
