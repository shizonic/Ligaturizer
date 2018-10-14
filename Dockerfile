FROM ubuntu:latest
LABEL maintainer Toby Merz <realtiaz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
    && apt-get install -qq -y --no-install-recommends \
        sudo \
        python \
        fontforge \
        python-fontforge \
    && apt-get -qq clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /etc/sudoers.d \
    && useradd -m -s /bin/bash -U application \
    && echo "application ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/application

USER application

WORKDIR /source
