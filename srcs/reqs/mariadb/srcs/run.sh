#!/bin/sh

# creatin in born run
# Database Creating
openrc 2> /dev/null  ; touch /run/openrc/softlevel; \
    /etc/init.d/mariadb setup 2> /dev/null ; \
    /etc/init.d/mariadb start 2> /dev/null ; \
    mysql -u root -e "CREATE DATABASE $DATABASE_NAME;";\
    mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';";\
    mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$DB_USER'@'%';";\
    mysql -u root -e "FLUSH PRIVILEGES;";
	mysql -u root $DATABASE_NAME < /$DATABASE_NAME.sql;
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"; \
	/etc/init.d/mariadb stop 2> /dev/null ;
    # mysql -u root -proot -e "USE wordpress; SOURCE /wordpress.sql;"

sed -i 's/#bind-address=0.0.0.0/bind-address=0.0.0.0/' /etc/my.cnf.d/mariadb-server.cnf
sed -i 's/skip-networking/#skip-networking/' /etc/my.cnf.d/mariadb-server.cnf
/etc/init.d/mariadb start 2> /dev/null
/etc/init.d/mariadb stop 2> /dev/null
#

# Run MariaDB in foreground mode by daemon
cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'



# mysqldump --add-drop-table -u root -p $DATABASE_NAME > $DATABASE_NAME.sql