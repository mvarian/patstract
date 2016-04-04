#!/bin/bash

## Patstract Pattern-Based File Extraction Script

## This script will extract any files matching the pattern to the destination, preserving file structure and permissions
## Created by Michael Varian https://github.com/mvarian


############### BEGIN CONFIGURATION ###############

## Set to 1 to dry run and only output results without taking action, set to 0 to run for real
DRYRUN=0

## Change these for your needs
SOURCE='/source-dir'
DEST='/dest-dir'
PATTERN='*.lnk'

############### END CONFIGURATION ###############


function movematch () {
	new=`echo $1 | sed "s|$2|$3|g"`
	newdir=$(dirname "${new}")
	mkdir -p $newdir
	rsync -lptgoDvz --remove-source-files $1 $new
}


if [ $DRYRUN == 1 ]
then
	clear
	echo -e "************DRY RUN************\n"
	find $SOURCE -name $PATTERN -exec echo {} \;
else
	clear
	echo -e "\n"
	export -f movematch
	find $SOURCE -name $PATTERN -exec bash -c 'movematch "$0" "$1" "$2"' {} $SOURCE $DEST $1 \;
#	rsync -lptgoDrv --remove-source-files --include=$PATTERN --include="$SOURCE/*/" --exclude='*' $SOURCE $DEST
fi

echo -e "\n"