all : run

run :
	@-sudo mkdir -p /home/orahmoun/data/db-data
	@-sudo mkdir -p /home/orahmoun/data/wp-data
	sudo export DOCKER_BUILDKIT=1
	sudo export BUILD_CACHE=true
	sudo docker compose  -f  ./srcs/docker-compose.yml build --parallel
	sudo docker compose  -f  ./srcs/docker-compose.yml --restart on-failure up


clean:
	@-sudo docker compose -f ./srcs/docker-compose.yml down -v --timeout 30

fclean: clean
	@-sudo rm -rf /home/orahmoun/data

re: fclean all
