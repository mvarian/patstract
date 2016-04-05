#!/bin/bash

## Patstract Pattern-Based File Extraction Script

## This script will extract any files matching the pattern to the destination, preserving file structure and permissions
## Created by Michael Varian https://github.com/mvarian


############### BEGIN CONFIGURATION ###############

## Set to 1 to dry run and only output results without taking action, set to 0 to run for real
DRYRUN=1

## Set to 1 to exclude use of -exec in the find command, as that may not be supported on all systems
## When in compatibility mode, matches in the root of the source path may not be included
COMPATIBILTY=0


## Change these for your needs
SOURCE="/source-dir/"
DEST="/dest-dir"
PATTERN='*.lnk'

############### END CONFIGURATION ###############


function movematch () {
	new=`echo $0 | sed "s|$SOURCE|$DEST|g"`
	newdir=$(dirname "${new}")
	mkdir -p $newdir
	rsync -lptgoDvz --remove-source-files $0 $new
}


if [ $DRYRUN == 1 ]
then
	clear
	echo -e "************DRY RUN************\n"
	find "$SOURCE" -name "$PATTERN" -print
else
	clear
	echo -e "\n"
	export -f movematch
	export SOURCE
	export DEST
	if [ $COMPATIBILTY == 1 ]
	then
		find "$SOURCE" -name "$PATTERN" -print | xargs bash -c 'movematch "$0"'
	else
		find $SOURCE -name $PATTERN -exec bash -c 'movematch "$0"' {} \;
	fi
fi

echo -e "\n"