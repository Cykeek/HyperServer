#!/bin/bash
# Made by @Electimon and @F1a5H

# Set this to your gdrive binary path either absolute or relative
GDRIVE_BIN=gdrive

display_usage() {
        echo -e "This script is for NEON, FOXY and HYPER PACKET servers..."
        echo -e "Usage: $0 [upload-file]"
}

if [[ -z $1 ]]
then
        display_usage
        exit 1
fi

UPLOADCMD=`$GDRIVE_BIN upload $1 | grep 'Uploaded' | awk '{print $2}'`

$GDRIVE_BIN share $UPLOADCMD > /dev/null
$GDRIVE_BIN info $UPLOADCMD | grep "DownloadUrl" | cut -b 14-100

