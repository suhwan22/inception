FROM alpine:3.17

ARG DB_NAME \
    DB_USER \
    DB_PASS \
    DB_ROOT

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client && \
    mkdir /var/run/mysqld && \
    chmod 777 /var/run/mysqld && \
#	{ echo '[mysqld]'; \
#      echo 'skip-host-cache'; \
#      echo 'skip-name-resolve'; \
#      echo 'bind-address=0.0.0.0'; \
#    } | tee  /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf && \
	sed -i 's/#bind-address=0.0.0.0/bind-address=0.0.0.0/g' /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

USER mysql

COPY ./conf/set-db.sh /set-db.sh

ENTRYPOINT ["/bin/sh", "/set-db.sh"]
#CMD [""]
#CMD ["/usr/bin/mysqld", "--skip-log-error"]
