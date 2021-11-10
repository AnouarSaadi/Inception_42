#!/bin/sh

if ! ls /home/$USER ; then
	addgroup -g 433 -S $USER
	adduser -u 431 -D -G $USER -h /home/$USER -s /bin/false  $USER
	echo "$USER:$PASS" | chpasswd
	chown $USER:$USER /home/$USER/ -R
fi
# telegraf -config /etc/telegraf.conf &
vsftpd /etc/vsftpd/vsftpd.conf
