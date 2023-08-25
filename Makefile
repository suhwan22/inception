all:
	mkdir ./srcs/db-volume ./srcs/wp-volumes
	docker-compose -f ./srcs/docker-compose.yml up -d

fclean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes
	docker system prune -a
	rm -rf ./srcs/db-volume ./srcs/wp-volume

re:
	make fclean
	make all

.PHONY: all fclean re
