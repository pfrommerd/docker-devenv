FROM nvidia/cudagl:11.4.2-devel-ubuntu20.04

# nvidia key fix
RUN apt-key del 7fa2af80                                                                                                                                                 
RUN apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/3bf863cc.pub
                                                                                  
ENV DEBIAN_FRONTEND noninteractive                                                                   
ENV DEBCONF_NONINTERACTIVE_SEEN true                                                                                                                                                      

RUN truncate -s0 /tmp/preseed.cfg; \
    echo "tzdata tzdata/Areas select America" >> /tmp/preseed.cfg; \
    echo "tzdata tzdata/Zones/America select New_York" >> /tmp/preseed.cfg; \
    debconf-set-selections /tmp/preseed.cfg; \
    rm -f /etc/timezone /etc/localtime; \
    apt-get update; \
    apt-get upgrade; \
    apt-get install -y tzdata; \
    apt-get install -y \
        software-properties-common build-essential wget curl \
        bash python3 python3-pip python3-dev python-is-python3 fish git neovim \
        libcairo2-dev pkg-config libcudnn8 gcc libosmesa6-dev; \
    rm -rf /var/lib/apt/lists/*

RUN echo "root:docker" | chpasswd

COPY env-base/entrypoint.sh /entrypoint.sh

ENV USER_REOWN_PATHS ""
ENTRYPOINT /entrypoint.sh
