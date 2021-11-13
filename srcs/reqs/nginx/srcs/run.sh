#!/bin/sh

#
telegraf -config /etc/telegraf.conf &
# run nginx in forgeround by daemon
nginx -g "daemon off;"
