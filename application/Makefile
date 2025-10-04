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

.PHONY: enter_zentao enter_yapi enter_yapi_init enter_ofelia enter_ninedata
enter_zentao:
	@${DC_ENTER} ${ZENTAO_CONTAINER_NAME} bash
enter_yapi_init:
	@${DC_ENTER} ${YAPI_CONTAINER_NAME}_init sh
enter_yapi:
	@${DC_ENTER} ${YAPI_CONTAINER_NAME} sh
enter_ofelia:
	@${DC_ENTER} ${OFELIA_CONTAINER_NAME} sh
enter_ninedata:
	@${DC_ENTER} ${NINEDATA_CONTAINER_NAME} bash
