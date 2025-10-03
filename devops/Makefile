include .env
include ../.cmd.env

.PHONY: help test
help:
	@echo "usage: make <option>"
	@echo "options and effects:"
	@echo "    help                     			: Show help"
	@echo "    test                     			: Test ..."
	@echo "    gitlab_initial_root_password         : 获取gitlab初始化密码"

test:
	@echo "test ..."
	@ssh -Tvvv git@gitlab.devops.top


.PHONY: enter_zentao enter_yapi enter_yapi_init enter_ofelia
enter_zentao:
	@${DC_ENTER} ${ZENTAO_CONTAINER_NAME} bash
enter_yapi_init:
	@${DC_ENTER} ${YAPI_CONTAINER_NAME}_init sh
enter_yapi:
	@${DC_ENTER} ${YAPI_CONTAINER_NAME} sh
enter_ofelia:
	@${DC_ENTER} ${OFELIA_CONTAINER_NAME} sh


.PHONY: echo_jenkins_initial_admin_password echo_generate_jenkins_ssh_key
echo_jenkins_initial_admin_password:
	@${DC_EXEC} ${JENKINS_CONTAINER_NAME} bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"
echo_generate_jenkins_ssh_key:
	@echo "ssh-keygen -t rsa -b 4096 -C \"jenkins\""

.PHONY: enter_jenkins enter_jenkins_with_root enter_dind echo_docker_login enter_sonarqube
enter_jenkins:
	@${DC_ENTER} ${JENKINS_CONTAINER_NAME} bash
enter_jenkins_with_root:
	@${DC_ENTER} -u root ${JENKINS_CONTAINER_NAME} bash
enter_dind:
	@${DC_ENTER} ${DIND_CONTAINER_NAME} sh
echo_docker_login:
	@echo "${DOCKER_REGISTRY_PASSWORD}" | docker login -u ${DOCKER_REGISTRY_USERNAME} ${DOCKER_REGISTRY} --password-stdin
enter_sonarqube:
	@${DC_ENTER} ${SONARQUBE_CONTAINER_NAME} bash

.PHONY: create_sonarqube_token rm_sonarqube_volume
create_sonarqube_token:
	@echo -n "your_secret" | openssl dgst -sha256 -hmac "zhiniuaiSonarqube123?" -binary | base64
rm_sonarqube_volume:
	@docker volume rm dce-cloud-devops-dock_sonarqube-data dce-cloud-devops-dock_sonarqube-log dce-cloud-devops-dock_sonarqube_extensions

.PHONY: dind_ls_cache dind_clear_all_cache dind_clear_until_cache
dind_ls_cache:
	@echo docker compose exec ${DIND_CONTAINER_NAME} docker buildx du --verbose
dind_clear_all_cache:
	@echo docker compose exec ${DIND_CONTAINER_NAME} docker buildx prune --all --force
dind_clear_until_cache:
	@echo docker compose exec ${DIND_CONTAINER_NAME} docker buildx prune --filter "until=168h"

.PHONY: gitlab_initial_root_password
gitlab_initial_root_password:
	@${DC_EXEC} ${GITLAB_CONTAINER_NAME} grep 'Password:' /etc/gitlab/initial_root_password

.PHONY: enter_gitlab
enter_gitlab:
	@${DC_ENTER} ${GITLAB_CONTAINER_NAME} bash
