nginx:
	docker run -it -d --name test_nginx -p 80:80 -p 443:443 nginx

fclean:
	docker rm -f test_nginx

re:
	fclean nginx

.PHONY: all fclean re
