FROM ubuntu:latest

RUN apt-get -qq update &&\
    apt-get -y --no-install-recommends -qq install wget curl git make ca-certificates &&\
    rm -rf /var/lib/apt/lists

RUN git clone https://github.com/Stifler6996/apt-mirror.git && cd apt-mirror &&\
    make install && cd .. && rm -rf apt-mirror

ENTRYPOINT apt-mirror