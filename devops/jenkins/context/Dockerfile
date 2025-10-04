ARG DOCKER_REGISTRY_URL=
ARG JENKINS_VERSION=latest
FROM ${DOCKER_REGISTRY_URL}jenkins/jenkins:${JENKINS_VERSION}

LABEL maintainer="zaizai <373045134@qq.com>"

ENV TZ=Asia/Shanghai

USER root

RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors4.tuna.tsinghua.edu.cn/alpine#g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apk add --no-cache curl rsync busybox-extras vim docker docker-cli docker-cli-buildx docker-cli-compose docker-zsh-completion ansible && \
    rm -rf /var/cache/apk/*

COPY --link daemon.json /etc/docker/daemon.json

# 创建.ssh目录并设置权限（drwx--S---对应2700）
RUN mkdir -p /var/jenkins_home/.ssh && \
    mkdir -p /usr/share/jenkins/ref/plugins && \
    chown jenkins:jenkins /var/jenkins_home/.ssh && \
    chmod 2700 /var/jenkins_home/.ssh

COPY --link --chown=jenkins:jenkins .ssh/id_rsa /var/jenkins_home/.ssh/id_rsa
COPY --link --chown=jenkins:jenkins .ssh/id_rsa.pub /var/jenkins_home/.ssh/id_rsa.pub

# 设置密钥权限
RUN chmod 600 /var/jenkins_home/.ssh/id_rsa && \
    chmod 644 /var/jenkins_home/.ssh/id_rsa.pub

RUN curl -o /usr/share/jenkins/ref/plugins/lark-notice.hpi -L https://gitee.com/xm721806280/lark-notice-plugin/releases/download/v2.0.0/lark-notice.hpi
RUN chown -R jenkins:jenkins /usr/share/jenkins/ref/plugins

COPY --link --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

USER jenkins
