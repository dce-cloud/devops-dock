ARG DOCKER_REGISTRY_URL=
ARG POSTGRES_VERSION=17.5
FROM ${DOCKER_REGISTRY_URL}postgres:${POSTGRES_VERSION}-alpine3.22

LABEL maintainer="zz <373045134@qq.com>"

ENV TZ=Asia/Shanghai

RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors4.tuna.tsinghua.edu.cn/alpine#g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apk add --no-cache curl busybox-extras vim && \
    rm -rf /var/cache/apk/*

CMD ["postgres"]

EXPOSE 5432
