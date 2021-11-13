FROM    alpine:3.14.2

LABEL   Author "asaadi <asaadi@student.1337.ma>"


RUN     apk add --update redis

ADD    ./srcs/run.sh /
RUN     chmod +x /run.sh

RUN		echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
		apk add telegraf
COPY	srcs/telegraf.conf /etc/
