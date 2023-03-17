DATA_PATH="/home/orahmoun/data"
DB_VOL="${DATA_PATH}/db-data"
WP_VOL="${DATA_PATH}/data/wp-data"
DOCKER_COMPOSE="./srcs/docker-compose.yml"

all : run

run :
	@-sudo mkdir -p ${DB_VOL}
	@-sudo mkdir -p ${WP_VOL}
	export DOCKER_BUILDKIT=1
	export BUILD_CACHE=true
	sudo docker compose  -f  ${DOCKER_COMPOSE} build --force-rm --compress --parallel
	sudo docker compose  -f  ${DOCKER_COMPOSE} up


clean:
	@-sudo docker compose -f ./srcs/docker-compose.yml down -v --remove-orphans --timeout 30

fclean: clean
	@-sudo rm -rf ${DATA_PATH}

re: fclean all