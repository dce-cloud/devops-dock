ARG DOCKER_REGISTRY_URL=
FROM ${DOCKER_REGISTRY_URL}jayfong/yapi:latest

LABEL maintainer="zaizai <373045134@qq.com>"

ENV TZ=Asia/Shanghai

ARG YAPI_VERSION=1.12.0

WORKDIR /yapi

COPY --link v${YAPI_VERSION}.zip .

RUN unzip -q v${YAPI_VERSION}.zip && \
    mv yapi-master vendors && \
    rm -f v${YAPI_VERSION}.zip \
    npm config set registry https://registry.npmmirror.com/

WORKDIR /yapi/vendors

EXPOSE 3008
