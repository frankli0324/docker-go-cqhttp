ARG version=1.0.0-beta3
ARG release_base=https://github.com/Mrs4s/go-cqhttp/releases

FROM debian:buster-slim

ARG version
ARG release_base

RUN sed -i s/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g /etc/apt/sources.list && \
    apt-get update && apt-get install -y wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    wget "${release_base}/download/v${version}/go-cqhttp_${version}_linux_amd64.deb" && \
    dpkg -i "go-cqhttp_${version}_linux_amd64.deb" && \
    rm go-cqhttp_${version}_linux_amd64.deb

WORKDIR /opt
ENTRYPOINT [ "go-cqhttp" ]
