#!/bin/bash

ARTIST=`osascript -e 'tell application "iTunes" to artist of current track as string'`
TRACK=`osascript -e 'tell application "iTunes" to name of current track as string'`

STRING="The current song is being played by ${ARTIST} and titled ${TRACK}"


echo $STRING
say $STRING
