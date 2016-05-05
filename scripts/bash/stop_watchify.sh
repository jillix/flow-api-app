#!/bin/bash

if [ -z "$1" ]
then
    echo "Please provide a PID file" >&2
    exit 1
fi

if [ ! -f "$1" ]
then
    exit
fi

TIMEOUT=0
if [ -n "$2" ]
then
    # TODO test that timeout is a number
    TIMEOUT=$2
fi

# sleep a bit until flow-app starts
sleep $TIMEOUT

ps aux | grep "[f]low-app" > /dev/null

until [ $? -gt 0 ]
do
    sleep 1
    ps aux | grep "[f]low-app" > /dev/null
done

# kill process by pid file and remove the pid file
if [ -f "$1" ]
then
    PID=$(cat "$1")
    kill $PID 2> /dev/null
    rm "$1"
fi
