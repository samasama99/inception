all : run

run :
	@sudo mkdir -p /home/orahmoun/data/db-data
	@sudo mkdir -p /home/orahmoun/data/wp-data
	sudo docker compose  -f  ./srcs/docker-compose.yml up --build


clean:
	@-sudo docker compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	@-sudo rm -rf /home/orahmoun/data

re: fclean all
