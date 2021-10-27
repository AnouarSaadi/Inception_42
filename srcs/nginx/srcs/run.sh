#!/bin/sh

openrc 2> /dev/null || true
touch /run/openrc/softlevel 2> /dev/null || true
service nginx start 2> /dev/null || true
sh