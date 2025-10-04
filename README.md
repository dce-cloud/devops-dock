# devops-dock

基于 Docker Compose 搭建的DevOps环境

# IP地址

内部IP地址从 172.25.50.3 开始

# 服务清单

## devops (172.25.50.3~172.25.55.3)

### scm (172.25.50.3~172.25.50.20)
| status | service | backend ip | version | 备注 |
| --- | ---| --- | --- | --- |
| &cross; | gitlab | 172.25.50.3 | 18.1.0-ce.0 | |
| &cross; | gitlab-runner | 172.25.50.4 | latest | |
| &cross; | gitee | 172.25.50.5 | 18.1.0-ce.0 | |

### ci (172.25.50.40~172.25.50.60)
| status | service | backend ip | version | 备注 |
| --- | ---| --- | --- | --- |
| &check; | jenkins | 172.25.50.40 | alpine3.22-jdk17 | 使用jdk17 |
| &check; | dind | 172.25.50.41 | 28.3.0-dind-alpine3.22 | |
| &cross; | sonarqube | 172.25.50.42 | latest | |
| &cross; | vault | 172.25.50.43 | 1.20 | |

### gateway (172.25.50.80~172.25.50.100)
| status | service | backend ip | version | 备注 |
| --- | ---| --- | --- | --- |
| &check; | traefik | 172.25.50.80 | v3.4 | |
| &check; | nginx | 172.25.50.81 | 1.29-alpine | |

### db (172.25.50.101~172.25.50.120)
| status | service | backend ip | version | 备注 |
| --- | ---| --- | --- | --- |
| &check; | mysql57 | 172.25.50.101 | mysql8.4 | |
| &check; | mysql | 172.25.50.102 | mysql8.4 | |
| &check; | redis | 172.25.50.103 | redis8.0.3 | |
| &check; | postgres | 172.25.50.104 | 17.5 | |
| &check; | mongo4 | 172.25.50.105 | 4.4 | |
| &check; | mongo | 172.25.50.106 | 8.0 | |

### storage (172.25.51.40~172.25.51.60)
| status | service | backend ip | version | 备注 |
| --- | ---| --- | --- | --- |
| &cross; | minio | 172.25.51.40 | RELEASE.2025-04-22T22-12-26Z-cpuv1 | |
| &cross; | rustfs | 172.25.51.41 | latest | |

### monitor (172.25.51.70~172.25.51.90)
| status | service | backend ip | version | 备注 |
| --- | ---| --- | --- | --- |
| &check; | portainer | 172.25.51.70 | 2.25.1-alpine | 127.0.0.1:19000 打开控制台 |
| &cross; | rancher | 172.25.51.71 | latest | |

## monitor (172.25.52.3~172.25.52.30)
| status | service | backend ip | version | 备注 |
| --- | ---| --- | --- | --- |
| &check; | alloy | 172.26.3.84 | 3 | |
| &check; | loki-read | 172.26.3.85 | 3 | |
| &check; | loki-write | 172.26.3.86 | 3 | |
| &check; | loki-backend | 172.26.3.87 | 3 | |
| &check; | grafana | 172.26.3.88 | 12.0.2 | |
| &cross; | Prometheus | 172.26.3.90 | | |
| &cross; | fluentbit | 172.26.3.91 | 4.0.4 | |

## application (172.25.53.3~172.25.53.120)
| status | service | backend ip | version | 备注 |
| --- | ---| --- | --- | --- |
| &cross; | zentao | 172.25.53.3 | latest | |
| &cross; | yapi | 172.25.53.4 | 1.12.0 | |
| &cross; | yapi-init | 172.25.53.5 | 1.12.0 | |
| &check; | ofelia | 172.25.53.6 | 0.3.18 | 用来执行定时任务(针对容器) |
| &check; | ninedata | 172.25.53.9 | latest | |
| &check; | traefik-whoami | 172.26.3.190 | latest | |
| &check; | traefik-whoami2 | 172.26.3.191 | latest | |

# 使用到的镜像
```json
[
    "traefik:v3.4",
    "docker:28.3.0-dind-alpine3.22",
    "jenkins.jenkins:alpine3.22-jdk17",
    "node:12.22.1-alpine",
    "node:18.20.4-alpine",
    "node:20.18.1-alpine",
    "nginx:1.29-alpine",
    "nginxinc/nginx-unprivileged:1.29-alpine-otel",
    "nginxinc/nginx-unprivileged:1.29-alpine"
    "alpine:3.22.1",
    "portainer/portainer-ce:2.31.2-alpine",
    "php:5.6.40-apache",
    "grafana/grafana:12.0.2",
    "grafana/loki:3",
    "grafana/alloy:v1.10.0",
    "fluent/fluent-bit:4.0.4",
    "tonistiigi/binfmt",
    "ninedata/ninedata:latest",
    "bitnami/mysql:5.7.43",
    "redis:8.0.3-alpine",
    "eclipse-temurin:17-jre-alpine",
    "maven:3.8.3-eclipse-temurin-17",
    "postgres:17.5-alpine3.22",
    "sonarqube:9.9-community",
    "node:14.21.3-alpine",
    "node:16.20.2-alpine",
    "hashicorp/vault:1.20",
    "mongo:7.0-jammy",
    "mongo:8.0-noble",
    "mongo:4.4",
    "easysoft/zentao:21.7.2",
    "sonarsource/sonar-scanner-cli:11",
    "python:2.7-slim-buster",
    "php:5.6-cli-stretch",
    "rancher/rancher:stable",
    "mcuadros/ofelia:0.3.18"
]
```

# 修改docker 配置文件
cat /etc/docker/daemon.json
```json
{
  "registry-mirrors": [
    "https://lt81ce2s.mirror.aliyuncs.com",
    "https://docker.1panel.live",
    "https://docker.1ms.run",
    "https://dytt.online",
    "https://lispy.org",
    "https://docker.xiaogenban1993.com",
    "https://docker.yomansunter.com",
    "https://666860.xyz",
    "https://a.ussh.net",
    "https://hub.rat.dev",
    "https://docker.m.daocloud.io"
  ],
  "data-root": "/data/docker",
  "log-driver": "json-file",
  "log-opts": {
    "max-size" : "10m",
    "max-file": "3"
  },
  "features": {
    "buildkit": true
  }
}
```

# 配置环境变量
```shell
echo "DOCKER_REGISTRY_URL=registry.cn-beijing.aliyuncs.com/zhiniuai/" >> /etc/environment
```

## 宿主机优化参数
```shell
sysctl -w vm.max_map_count=524288
sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192
```
