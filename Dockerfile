# Simple Dockerfile for SWO3

FROM ubuntu:19.04

LABEL maintainer="Erik Pitzer <erik.pitzer@fh-hagenberg.at>" version="19.0"

RUN apt-get update && \
    yes | unminimize && \
    apt-get -y upgrade && \
    apt-get install -y build-essential procps cmake cppcheck valgrind vim-tiny man-db less && \
    apt autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

ENV SHELL /bin/bash
WORKDIR /home/swo
VOLUME workdir /home/swo
CMD ["bash"]

# docker build -t epitzer/swo .
# docker run --name swo --rm -i -t epitzer/swo bash
