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
ARG VERSION="1.6.14"
WORKDIR /root
RUN wget --inet4-only https://nim-lang.org/download/nim-${VERSION}-linux_x64.tar.xz && \
    tar -Jxf nim-${VERSION}-linux_x64.tar.xz && \
    rm -f nim-${VERSION}-linux_x64.tar.xz && \
    mv nim-${VERSION} .nimble

RUN rm -rf /var/lib/apt/lists/*
ENV PATH $PATH:/root/.nimble/bin

# ========== Bun ==========
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH $PATH:/root/.bun/bin

WORKDIR /root/project
