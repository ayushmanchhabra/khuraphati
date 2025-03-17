#!/bin/bash

if [[ "$1" == 'h' || "$1" == 'help' ]]; then
    echo -e "aos.sh <command>\n"
    echo -e "Usage:\n"
    echo "./aos.sh (h)elp ..Get information on how to use this script"
    echo "./aos.sh (e)xtract com.package.name /path/to/outDir ..Extract APK(s) from Android device using Android Debug Bridge (adb)"
    exit 0
elif [[ "$1" == "e" || "$1" == "extract" ]]; then
    extract_apk "$2" "$3"
else
    echo "Unknown command. Please consult the -h or --help command for guidance."
fi

# Extract APKs from Android device using Android Debug Bridge (adb).
function extract_apk () {
    # Package name of target APK(s)
    PKG_NAME=$1
    # Directory in which to extract target APK(s)
    OUT_DIR=$2
    # Store output of adb command in a variable
    PKG_PATH=$( adb shell pm path "$PKG_NAME" )
    # Sort the output by \n and store in array
    mapfile -t PKG_PATHS <<< "$PKG_PATH"
    # Extract APK(s) into OUT_DIR directory.
    for PATH in "${PKG_PATHS[@]}"; do
	    adb pull "$PATH#package: $OUT_DIR"
    done
}
