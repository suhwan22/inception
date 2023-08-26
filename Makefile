NAME = inception


all: $(NAME)

$(NAME) :
	sudo mkdir -p /home/suhkim/data/wordpress
	sudo mkdir -p /home/suhkim/data/mariadb
	sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

up :
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

down :
	sudo docker-compose -f ./srcs/docker-compose.yml down

fclean:
	sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes
	sudo docker system prune -a
	sudo rm -rf /home/suhkim/data/wordpress
	sudo rm -rf /home/suhkim/data/mairadb

re:
	sudo make fclean
	sudo make all

.PHONY: all fclean re up down
