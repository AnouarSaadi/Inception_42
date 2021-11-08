#!/bin/sh
PASSWORDROOT=$MYSQL_ROOT_PASSWORD
DBNAME=$DATABASE_NAME
WPUSER=$WP_USER
WPPASS=$WP_PASSWORD
# Database Creating
openrc 1> /dev/null  ; touch /run/openrc/softlevel; \
    /etc/init.d/mariadb setup 1> /dev/null ; \
    /etc/init.d/mariadb start 1> /dev/null ; \
    mysql -u root -e "CREATE DATABASE $DBNAME;";\
    mysql -u root -e "CREATE USER '$WPUSER'@'%' IDENTIFIED BY '$WPPASS';";\
    mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$WPUSER'@'%';";\
    mysql -u root -e "FLUSH PRIVILEGES;";
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$PASSWORDROOT';"; \
	/etc/init.d/mariadb stop 1> /dev/null ;
    # mysql -u root -proot -e "USE wordpress; SOURCE /wordpress.sql;"

/etc/init.d/mariadb start 1> /dev/null
/etc/init.d/mariadb stop 1> /dev/null

# Run MySQl in foreground mode
cd /usr ; /usr/bin/mysqld_safe
