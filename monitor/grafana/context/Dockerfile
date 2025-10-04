ARG DOCKER_REGISTRY_URL=
ARG GRAFANA_VERSION=latest
FROM ${DOCKER_REGISTRY_URL}grafana/grafana:${GRAFANA_VERSION}

LABEL maintainer="zaizai <373045134@qq.com>"

USER root

ENV TZ=Asia/Shanghai

RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors4.tuna.tsinghua.edu.cn/alpine#g' /etc/apk/repositories && \
    apk update && \
   
    apk add --no-cache tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apk add --no-cache curl busybox-extras vim && \
    rm -rf /var/cache/apk/*

ENV TERM=linux \
    GF_LOG_LEVEL=debug \
    GF_PATHS_PROVISIONING=/etc/grafana/provisioning \ 
    GF_USERS_ALLOW_SIGN_UP=false \
    GF_AUTH_ANONYMOUS_ENABLED=false \
    GF_SECURITY_ADMIN_USER=admin \
    GF_SECURITY_ADMIN_PASSWORD__FILE=/run/secrets/admin_password \
    GF_PLUGINS_PREINSTALL=grafana-clock-panel,grafana-simple-json-datasource

USER grafana
