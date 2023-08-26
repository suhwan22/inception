all:
	sudo mkdir -p /home/suhkim/data/wordpress
	sudo mkdir -p /home/suhkim/data/mariadb
	sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

fclean:
	sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes
	sudo docker system prune -a
	sudo rm -rf ./srcs/db-volume ./srcs/wp-volume

re:
	sudo make fclean
	sudo make all

.PHONY: all fclean re
