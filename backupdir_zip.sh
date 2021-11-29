#!/bin/bash

# Short-circuiting Guard Clause - First 3 args must be present && not empty strings
[[ -z "$1" ||  -z "$2" || -z "$3" ]] && [[ !$1 && !$2 && !$3 ]] && echo "First three aguments are required! Please try again."

# Get drive paths (lowercase for wsl)
SRC_DRIVE=$(echo "$1" | tr '[:upper:]' '[:lower:]')
SRC_DRIVE_PATH=/mnt/$SRC_DRIVE/
TRG_DRIVE=$(echo "$3" | tr '[:upper:]' '[:lower:]')
TRG_DRIVE_PATH=/mnt/$TRG_DRIVE/

# SOURCE: Grab the faull path of source dir
SRC_DIR=$(find $SRC_DRIVE_PATH -type d -name "$2" | grep -vi "RECYCLE" 2>/dev/null)

# TARGET: If target folder is missing - place in root. otherwise find it
if [[ -z "$4" ]]
then
	TRG_DIR=$TRG_DRIVE_PATH
else
	TRG_DIR=$(find $TRG_DRIVE_PATH -type d -name "$4" | grep -vi "RECYCLE" 2>/dev/null)
fi

# Save script location
RUN_DIR=$(find ~/ -type f -name "backupdir_zip.sh")


ZIP_FILE=$2.zip
# Change to src dir
cd $SRC_DIR;cd ../;

# Create archive - FLAGS: create,verbose,zip,filename
zip -r $ZIP_FILE $2/

#  Move to target dir
mv $ZIP_FILE $TRG_DIR

# See if we're extracting
if [[ "$5" == 'extract' ]]
then
	# Extract here at target dir
	cd $TRG_DIR;rm -r $2; unzip -o $ZIP_FILE
    rm -r $ZIP_FILE
fi

# Before displaying success msg, add an alias if requested
if [[ -z "$6" ]]
then
	echo 'Completed!'
else
	# Add this alias 
	echo "alias $6='bash $RUN_DIR $1 $2 $3 $4 $5'" >> ~/.bashrc
	echo "Completed! Run this backup again by simply typing '$6' at any time."
	echo "Run 'source ~/.bashrc' or log out/in for these changes to take effect"
fi

