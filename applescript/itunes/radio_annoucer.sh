#!/bin/bash

ARTIST=''
TRACK=''
while :
do
    NEWARTIST=`osascript -e 'tell application "iTunes" to artist of current track as string'`
    NEWTRACK=`osascript -e 'tell application "iTunes" to name of current track as string'`

    if [ "${ARTIST}" ==  "${NEWARTIST}" ]
    then
        sleep 5
    else
        ARTIST="${NEWARTIST}"
        TRACK="${NEWTRACK}"
        STRING="The current song is being played by ${ARTIST} and titled ${TRACK}"
        echo $STRING
        say $STRING
    fi
    sleep 1
done
