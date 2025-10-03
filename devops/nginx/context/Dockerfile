ARG DOCKER_REGISTRY_URL=
ARG NGINX_VERSION=latest
FROM ${DOCKER_REGISTRY_URL}nginx:${NGINX_VERSION}

LABEL maintainer="zaizai <373045134@qq.com>"

ENV TZ=Asia/Shanghai

RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors4.tuna.tsinghua.edu.cn/alpine#g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apk --update add logrotate && \
    apk add --no-cache openssl bash curl && \
    rm -rf /var/cache/apk/* && \
    touch /var/log/messages

COPY --link sites/ /etc/nginx/conf.d/
COPY --link ssl/ /etc/nginx/ssl/
COPY --link nginx.conf /etc/nginx/
COPY --link logrotate/nginx /etc/logrotate.d/

EXPOSE 80 443
ENTRYPOINT ["nginx", "-c", "/etc/nginx/nginx.conf"]
CMD ["-g", "daemon off;"]
