ARG DOCKER_REGISTRY_URL=
ARG VAULT_VERSION=1.20
FROM ${DOCKER_REGISTRY_URL}hashicorp.vault:${VAULT_VERSION}

LABEL maintainer="zaizai <373045134@qq.com>"

ENV TZ=Asia/Shanghai

RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors4.tuna.tsinghua.edu.cn/alpine#g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apk add --no-cache curl busybox-extras vim && \
    rm -rf /var/cache/apk/*
