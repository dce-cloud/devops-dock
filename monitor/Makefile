include .env
include ../.cmd.env

.PHONY: help test
help:
	@echo "usage: make <option>"
	@echo "options and effects:"
	@echo "    help                     			: Show help"
	@echo "    test                     			: Test ..."

test:
	@echo "test ..."

.PHONY: enter_portainer enter_grafana enter_fluentbit
enter_portainer:
	@${DC_ENTER} ${PORTAINER_CONTAINER_NAME} sh
enter_grafana:
	@${DC_ENTER} ${GRAFANA_CONTAINER_NAME} sh
enter_fluentbit:
	@${DC_ENTER} ${FLUENTBIT_CONTAINER_NAME} sh

.PHONY: build_alg start_alg
build_alg:
	@${DC_BUILD} --no-cache ${ALLOY_CONTAINER_NAME} ${GRAFANA_CONTAINER_NAME} ${LOKI_READ_CONTAINER_NAME} ${LOKI_WRITE_CONTAINER_NAME} ${LOKI_BACKEND_CONTAINER_NAME}
start_alg:
	@${DC_UP} ${ALLOY_CONTAINER_NAME} ${GRAFANA_CONTAINER_NAME} ${LOKI_READ_CONTAINER_NAME} ${LOKI_WRITE_CONTAINER_NAME} ${LOKI_BACKEND_CONTAINER_NAME}
rm_volume:
	@docker volume rm zn-monitor_grafana-data zn-monitor_loki-backend-data zn-monitor_loki-read-data zn-monitor_loki-write-data