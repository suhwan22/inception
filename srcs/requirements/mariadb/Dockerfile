FROM alpine:3.17.4

ARG DB_NAME=wordpress \
    DB_USER=wpuser \
    DB_PASS=wppass \
    DB_ROOT=rootpass

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client && \
    mkdir /var/run/mysqld && \
    chmod 777 /var/run/mysqld && \
    sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY ./conf/set-db.sh .

RUN sh set-db.sh && rm set-db.sh

USER mysql

CMD ["/usr/bin/mysqld", "--skip-log-error"]
