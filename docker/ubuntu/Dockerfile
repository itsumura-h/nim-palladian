FROM ubuntu:22.04

# prevent timezone dialogue
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update; apt install -y libgnutls30
RUN apt update; \
    apt upgrade -y
RUN apt install -y \
        gcc \
        xz-utils \
        ca-certificates \
        unzip \
        vim \
        curl \
        wget \
        git \
        libsass-dev

# ========== Nim ==========
ARG VERSION="2.0.0"
WORKDIR /root
RUN curl https://nim-lang.org/choosenim/init.sh -o init.sh
RUN sh init.sh -y
RUN rm -f init.sh
ENV PATH $PATH:/root/.nimble/bin
RUN choosenim ${VERSION}

# ========== Bun ==========
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH $PATH:/root/.bun/bin

WORKDIR /root/project
RUN git config --global --add safe.directory /root/project
COPY ./palladian.nimble .
RUN nimble install -y -d
