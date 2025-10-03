ARG DOCKER_REGISTRY_URL=
ARG SONARQUBE_VERSION=9.9
FROM ${DOCKER_REGISTRY_URL}sonarqube:${SONARQUBE_VERSION}-community

LABEL maintainer="zaizai <373045134@qq.com>"

ENV TZ=Asia/Shanghai SONAR_JAVA_OPTS="-Duser.timezone=Asia/Shanghai"

USER root

COPY --link ubuntu.sources /etc/apt/sources.list
COPY --link sonar-l10n-zh-plugin-9.9.jar /opt/sonarqube/extensions/plugins/

RUN apt-get update && apt-get install -y --no-install-recommends tzdata curl vim && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    rm -rf /var/lib/apt/lists/*
    
USER sonarqube
