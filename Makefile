up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

nginx:
	docker run -it -d --net=test_network --name test_nginx -p 80:80 -p 443:443 test_nginx

build:
	docker build . -t test_nginx

image_clean:
	docker rmi test_nginx

fclean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes
	docker system prune -a

re:
	make fclean
	make build
	make nginx

sh:
	docker exec -it test_nginx sh

.PHONY: all fclean re build image_clean sh
