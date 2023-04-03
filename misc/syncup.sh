#!/usr/bin/bash
ROMVER=$1
ROM=$2

case $ROMVER in
8|oreo|o)
	AVER=8
	ABCVER=oreo
	NUMVER=eight
	LOSVER=lineage-15.1
	;;
9|pie|p)
	AVER=9
	ABCVER=pie
	NUMVER=nine
	LOSVER=lineage-16.0
	;;
10|q)
	AVER=10
	ABCVER=Q
	NUMVER=ten
	LOSVER=lineage-17.1
	;;
11|r)
	AVER=11
	ABCVER=R
	NUMVER=eleven
	LOSVER=lineage-18.0
	;;
esac
shift

case $ROM in
aex)
	ROM=aex
	GITURL=AospExtended
	;;
havoc)
	ROM=havoc
	GITURL=Havoc-OS
	;;
flos)
	ROM=flos
	GITURL=ForkLineageOS
	;;
los|lineage|lineageos)
	ROM=los
	GITURL=LineageOS
	;;
pixel|pe|pixelexp|pixelexperience)
	ROM=pe
	GITURL=PixelExperience
rr)
	ROM=rr
	GITURL=ResurrectionRemix
	;;
esac
shift

# AospExtended
aex() {
	BRANCHVER=$AVER.x
	repo init -u git://github.com/AospExtended/manifest.git -b $BRANCHVER
	rs
	exit $?
}

# ForkLineageOS
flos() {
	BRANCHVER=$LOSVER
	repo init -u git://github.com/ForkLineageOS/android.git -b $BRANCHVER
	rs
}

# Havoc
havoc() {
	BRANCHVER=$NUMVER
	repo init -u git://github.com/Havoc-OS/android_manifest.git -b $BRANCHVER
	rs
}

# LineageOS
los() {
	BRANCHVER=$LOSVER
	repo init -u git://github.com/LineageOS/android.git -b $BRANCHVER
	rs
}

# ForkLineageOS
pixel() {
	BRANCHVER=$NUMVER
	repo init -u git://github.com/PixelExperience/android.git -b $BRANCHVER
	rs
}

# Ressurrection Remix
rr() {
	BRANCHVER=$ABCVER
	repo init -u git://github.com/ResurrectionRemix/platform_manifest.git -b $BRANCHVER
	rs
}

syncup() {
repo sync -j$( nproc --all ) --force-sync -c --no-clone-bundle --no-tags --optimized-fetch --prune
}

syntax() {
			echo -e "usage: ./syncup.sh <rom> <version>"
}

if [ ! "$ROM" ];then
	syntax
	exit $?
else
	if [ ! "$ROMVER" ];then
		syntax
		exit $?
	else
		mkdir -p $ROMVER/$ROM
		cd $ROMVER/$ROM
		if [ "$ROM" = "aex" ] || [ "$ROM" = "flos" ] || [ "$ROM" = "havoc" ] || [ "$ROM" = "los" ] || [ "$ROM" = "pe" ] || [ "$ROM" = "rr" ]; then
			$ROM
		else
			syntax
			exit $?
		fi
		syncup
	fi
fi
