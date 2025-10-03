include .cmd.env

.PHONY: help test
help:
	@echo "usage: make <option>"
	@echo "options and effects:"
	@echo "    help                     : Show help"
	@echo "    test                     : Test ..."

test:
	@echo "test ..."

.PHONY: echo_init_network
echo_init_network:
	@echo ${DOCKER} network ls
	@echo ${DOCKER} network create --driver ${DOCKER_NETWORK_DRIVER} --subnet=${DOCKER_BACKEND_SUBNET} --gateway=${DOCKER_BACKEND_SUBNET_GATEWAY} ${DOCKER_BACKEND_NETWORK_NAME}
	@echo ${DOCKER} network ls
	