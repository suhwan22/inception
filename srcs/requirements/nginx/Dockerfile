FROM alpine:3.17.4

RUN apk update && apk upgrade && \
    apk add --no-cache nginx openssl vim && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/suhkim.42.fr.key \
    -out /etc/nginx/ssl/suhkim.42.fr.crt \
    -subj "/C=KR/ST=Seoul/O=42Seoul/OU=suhkim/CN=inception/" && \
	chown -R nginx /etc/nginx/ssl/suhkim.42.fr.crt && \
    chown -R nginx /etc/nginx/ssl/suhkim.42.fr.key && \
	mkdir -p /var/www/html

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

# 컨테이너에서 443 포트 열기
EXPOSE 443

# 컨테이너 실행 시 nginx 시작
CMD ["nginx", "-g", "daemon off;"]

