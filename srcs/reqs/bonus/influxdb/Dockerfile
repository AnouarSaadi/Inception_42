FROM        alpine:3.
LABEL       Author "asaadi <asaadi@student.1337.ma>"

RUN         apk update
RUN         apk add influxdb

RUN         echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
            apk add telegraf
COPY        srcs/telegraf.conf /etc/

COPY        srcs/run.sh /
RUN         chmod +x /run.sh
