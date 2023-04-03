#!/bin/bash
DEVICE="$1"
if [[ -z "$1" ]]; then
	echo -e "usage: $0 device"
	exit 1
else
        UPFILE=`ls out/target/product/$DEVICE/*.zip|grep -iv ota|tail -n1`
        UPLINK=`gdrive upload "$UPFILE"|grep 'Uploaded'|awk '{print $2}'`
        gdrive share "$UPLINK"
        gdrive info "$UPLINK"
fi
