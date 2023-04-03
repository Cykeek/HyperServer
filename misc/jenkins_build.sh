#!/bin/bash

DEVICE="$1"

THREAD="-j$(grep -c ^processor /proc/cpuinfo)"

export TZ="Asia/Kolkata"
export KBUILD_BUILD_USER="$USER"

source build/envsetup.sh

if [ -f "out/.lock" ]; then
rm out/.lock
fi

aospa="vendor/aospa/"
arrow="vendor/arrow/"
syberia="vendor/syberia/"
xdroid="vendor/xdroid"
derp="vendor/derp"
twrp="vendor/twrp/"

env=vendor/*/build/envsetup.sh
is_check="brunch"

if [ -f "$env" ]; then
    echo "File $env does not exist."
    exit 1
fi

if [ -d "$arrow" ]; then
cmd=$(grep -ci "$is_check" build/envsetup.sh)
else
cmd=$(grep -ci "$is_check" $env)
fi

if [ "$cmd" != "0" ]; then
    echo "Brunch exists"
    # roast it :)
    brunch $DEVICE
else
    echo "Brunch does not exist. Time for bacon"
    if [ -d "$aospa" ]; then
        echo "aospa rom detected"
        ./rom-build.sh $DEVICE
    elif [ -d "$arrow" ]; then
        echo "arrow rom detected"
        lunch arrow_$DEVICE-userdebug
        mka bacon $THREAD
    elif [ -d "$syberia" ]; then
        echo "syberia rom detected"
        lunch syberia_$DEVICE-userdebug
        mka bacon $THREAD
    elif [ -d "$xdroid" ]; then
        echo "xdroid rom detected"
        lunch xdroid_$DEVICE-userdebug
        mka xd $THREAD
    elif [ -d "$derp" ]; then
        echo "derpfest rom detected"
        lunch derp_$DEVICE-userdebug
        mka derp $THREAD
    elif [ -d "$twrp" ]; then
        echo "TWRP recovery detected"
        lunch twrp_$DEVICE-eng
        make recoveryimage $THREAD
    else
        lunch aosp_$DEVICE-userdebug
        mka bacon $THREAD
    fi
fi
