ARG DOCKER_REGISTRY_URL=
ARG DIND_VERSION
FROM ${DOCKER_REGISTRY_URL}docker:${DIND_VERSION}

LABEL maintainer="zaizai <373045134@qq.com>"

ENV TZ=Asia/Shanghai

RUN addgroup -g 1000 dind && \
    adduser -D -u 1000 -G dind dind

RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors4.tuna.tsinghua.edu.cn/alpine#g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apk add --no-cache curl busybox-extras vim && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /etc/docker

COPY --link daemon.json /etc/docker/daemon.json
