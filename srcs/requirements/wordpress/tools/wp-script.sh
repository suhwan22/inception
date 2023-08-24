#!bin/sh

wp core download --allow-root --path=/var/www/html

wp core install \
   --allow-root \
   --path=${WORDPRESS_PATH} \
   --url=${WORDPRESS_URL} \
   --title=Inception \
   --admin_user=${WORDPRESS_ADMIN} \
   --admin_password=${WORDPRESS_ADMIN_PASSWORD} \
   --admin_email=${WORDPRESS_ADMIN_EMAIL} \
   --skip-email

cd /var/www/html

wp user create ${WORDPRESS_USER} \
               ${WORDPRESS_USER_EMAIL} \
               --user_pass=${WORDPRESS_USER_PASSWORD} \
               --role=author --allow-root

chmod -R 0777 /var/www/html/wp-content/

/usr/sbin/php-fpm81 -F
