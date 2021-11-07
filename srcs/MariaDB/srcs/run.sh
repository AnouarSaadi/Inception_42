#!/bin/sh

# Database Creating
openrc 2> /dev/null || true ; touch /run/openrc/softlevel; \
    /etc/init.d/mariadb setup 2> /dev/null || true; \
    /etc/init.d/mariadb start 2> /dev/null || true; \
    mysql -u root -e "CREATE DATABASE wordpress;";\
    mysql -u root -e "CREATE USER 'wpuser'@'%' IDENTIFIED BY 'wppass';";\
    mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'%';";\
    mysql -u root -e "FLUSH PRIVILEGES;";
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';"; \
	/etc/init.d/mariadb stop 2> /dev/null || true;
    # mysql -u root -proot -e "USE wordpress; SOURCE /wordpress.sql;"

# Run MySQl in foreground mode
/usr/bin/mysqld -u root
