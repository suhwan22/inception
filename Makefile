all:
	docker-compose -f ./srcs/docker-compose.yml up -d

fclean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes
	docker system prune -a

re:
	make fclean
	make all

.PHONY: all fclean re
