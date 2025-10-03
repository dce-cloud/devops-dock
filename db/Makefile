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

.PHONY: enter_mysql57 enter_mysql8 enter_liyue_mysql enter_qingqiu_mysql
enter_mysql57:
	@${DC_ENTER} ${MYSQL57_CONTAINER_NAME} bash
enter_mysql8:
	@${DC_ENTER} ${MYSQL8_CONTAINER_NAME} bash
enter_liyue_mysql:
	@${DC_ENTER} ${LIYUE_MYSQL_CONTAINER_NAME} bash
enter_qingqiu_mysql:
	@${DC_ENTER} ${QINGQIU_MYSQL_CONTAINER_NAME} bash

.PHONY: enter_redis enter_liyue_redis enter_qingqiu_redis
enter_redis:
	@${DC_ENTER} ${REDIS_CONTAINER_NAME} bash
enter_liyue_redis:
	@${DC_ENTER} ${LIYUE_REDIS_CONTAINER_NAME} bash
enter_qingqiu_redis:
	@${DC_ENTER} ${QINGQIU_REDIS_CONTAINER_NAME} bash

.PHONY: enter_ninedata
enter_ninedata:
	@${DC_ENTER} ${NINEDATA_CONTAINER_NAME} bash

.PHONY: enter_postgres enter_liyue_postgres enter_qingqiu_postgres
enter_postgres:
	@${DC_ENTER} ${POSTGRES_CONTAINER_NAME} bash
enter_liyue_postgres:
	@${DC_ENTER} ${LIYUE_POSTGRES_CONTAINER_NAME} bash
enter_qingqiu_postgres:
	@${DC_ENTER} ${QINGQIU_POSTGRES_CONTAINER_NAME} bash

.PHONY: enter_mongo enter_mongo4 enter_mongo7 enter_liyue_mongo enter_qingqiu_mongo
enter_mongo:
	@${DC_ENTER} ${MONGO_CONTAINER_NAME} bash
enter_mongo4:
	@${DC_ENTER} ${MONGO4_CONTAINER_NAME} bash
enter_mongo7:
	@${DC_ENTER} ${MONGO7_CONTAINER_NAME} bash
enter_liyue_mongo:
	@${DC_ENTER} ${LIYUE_MONGO_CONTAINER_NAME} bash
enter_qingqiu_mongo:
	@${DC_ENTER} ${QINGQIU_MONGO_CONTAINER_NAME} bash
