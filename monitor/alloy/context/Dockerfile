ARG DOCKER_REGISTRY_URL=
ARG ALLOY_VERSION=latest
FROM ${DOCKER_REGISTRY_URL}grafana.alloy:${ALLOY_VERSION}

LABEL maintainer="zaizai <373045134@qq.com>"

ENV TZ=Asia/Shanghai

COPY --link ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
