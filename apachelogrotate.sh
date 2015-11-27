#!/bin/bash
#Author: Biranchi Mohanty
#Desc: Moving files to /vol/logprocessor/prod/raw/bkup directory
BACKUP_DIR="/vol/logprocessor/prod/raw/bkup"
FILE_FORMAT=$(date +%Y.%m.%d.%I)
LOGFILE="/vol/logprocessor/prod/raw/*.log"
alias 60minold="ls -1 $LOGFILE | grep -v $FILE_FORMAT | grep -v bkup"
alias ls=ls
COUNT=`60minold | wc -l`
if [ $COUNT -gt 1 ]
	then
	for i in `60minold` ; do mv $i $BACKUP_DIR; done
	echo "$COUNT log file(s) has been moved"
	else
	echo  "$COUNT log file found"
	echo "$(ls -1 $LOGFILE | wc -l) actual log file found"
fi
