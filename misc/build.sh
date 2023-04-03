# ccache
export USE_CCACHE=1
export CCACHE_DIR=/home/hyper/ccache/loso_$device
prebuilts/misc/linux-x86/ccache/ccache -M 30G

THREAD="-j$(grep -c ^processor /proc/cpuinfo)"
1="$device"

export TZ="Asia/Kolkata"

. build/envsetup.sh

repopick -f 221518 221519 229251 231005 237124

rm out/.lock

# roast it :)
brunch $device

