#!/bin/sh

#  creatin in born run
sed -i 's/127.0.0.1/0.0.0.0/' /etc/php7/php-fpm.d/www.conf
mv /wordpress/* /www/wordpress/; mv /www/wordpress/wp-config-sample.php /www/wordpress/wp-config.php
rm -rf /wordpress
sed -i 's/define( 'DB_NAME', '' )/define( 'DB_NAME', '$DATABASE_NAME' )/' /www/wordpress/wp-config.php
sed -i 's/define( 'DB_USER', '' )/define( 'DB_USER', '$DB_USER' )/' /www/wordpress/wp-config.php
sed -i 's/define( 'DB_PASSWORD', '' )/define( 'DB_PASSWORD', '$DB_PASSWORD' )/' /www/wordpress/wp-config.php
sed -i 's/define( 'DB_HOST', '' )/define( 'DB_HOST', '$DB_HOST' )/' /www/wordpress/wp-config.php
#
/usr/sbin/php-fpm7 -FR
