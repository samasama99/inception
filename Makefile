all : run

run :
	@-mkdir -p ${HOME}/data/db-data
	@-mkdir -p ${HOME}/data/wp-data
	docker-compose  -f  ./srcs/docker-compose.yml up --build


clean:
	@-docker-compose -f ./srcs/docker-compose.yml down --remove-orphans

fclean: clean
	@-rm -rf ${HOME}/data
	@-docker volume rm $$(docker volume ls -q)
	@-docker network rm $$(docker network ls -q)

re: fclean all
