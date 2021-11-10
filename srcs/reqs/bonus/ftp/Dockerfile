FROM    alpine:3.14.2

LABEL   Author "asaadi <asaadi@student.1337.ma>"

RUN     apk update
    #FTP Server
RUN     apk add vsftpd 

    # Getting vsftpd config
COPY    srcs/vsftpd.conf /etc/vsftpd/

COPY    srcs/run.sh /
RUN     chmod +x /run.sh
