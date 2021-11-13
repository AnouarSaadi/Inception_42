#!bin/sh

sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis.conf
sed -i "s|protected-mode yes|protected-mode no|g" /etc/redis.conf

telegraf -config /etc/telegraf.conf &
/usr/bin/redis-server /etc/redis.conf #config path
