#!/bin/bash

# BASH Script with some perl mixed in :)

DATETIME_SCRIPT=`perl -e 'use Time::localtime;printf("%d%02d%02d-%02d%02d%02d\n", localtime->year() + 1900,localtime->mon() + 1,localtime->mday(),localtime->hour(),localtime->min(),localtime->sec());'`

if [ $# == 1 ];
then
	tar cfz $DATETIME_SCRIPT-documentsdir-${1}.tgz /Users/${1}/Documents
	tar cfz $DATETIME_SCRIPT-picsdir-${1}.tgz /Users/${1}/Pictures
	tar cfz $DATETIME_SCRIPT-gitrepdir-${1}.tgz /Users/${1}/repos
	tar cfz $DATETIME_SCRIPT-googleapp-${1}.tgz /Users/${1}/googleapp
	tar cfz $DATETIME_SCRIPT-KeyChain-${1}.tgz /Users/${1}/Library/Keychains
	tar cfz $DATETIME_SCRIPT-MobileDevice-${1}.tgz /Users/${1}/Library/MobileDevice
	tar cfz $DATETIME_SCRIPT-iPhoneBackup-${1}.tgz /Users/${1}/Library/Application\ Support/MobileSync
	tar cfz $DATETIME_SCRIPT-JBiPhoneBackup-${1}.tgz /Users/${1}/iPhone
else
	echo "Usage: ${0} username"
fi

