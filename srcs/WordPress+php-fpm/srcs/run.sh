#!/bin/sh

sed -i 's/127.0.0.1/0.0.0.0/' /etc/php7/php-fpm.d/www.conf
mv /wordpress/* /www/wordpress/

/usr/sbin/php-fpm7 -FR