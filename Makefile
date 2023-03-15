all : run

run :
	@-sudo mkdir -p /home/orahmoun/data/db-data
	@-sudo mkdir -p /home/orahmoun/data/wp-data
	export DOCKER_BUILDKIT=1
	export BUILD_CACHE=true
	sudo docker compose  -f  ./srcs/docker-compose.yml build --force-rm --compress --parallel
	sudo docker compose  -f  ./srcs/docker-compose.yml up


clean:
	@-sudo docker compose -f ./srcs/docker-compose.yml down -v --remove-orphans --timeout 30

fclean: clean
	@-sudo rm -rf /home/orahmoun/data

re: fclean all