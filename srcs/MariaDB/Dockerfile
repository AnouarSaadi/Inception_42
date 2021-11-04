FROM    alpine:3.12
LABEL   Author "asaadi <asaadi@student.1337.ma>"

RUN     apk update 

RUN     apk add mariadb mariadb-client; apk add openrc

COPY    srcs/*.sh /
RUN     chmod +x /*.sh

ENTRYPOINT [ "/run.sh" ]