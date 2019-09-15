#!/usr/bin/env bash

# Universal bits
readonly HACKS_DIR="/home/pi/RetroPie/roms/snesh"
readonly ROMS_DIR="/home/pi/RetroPie/roms/snes"

function installHack () {
    cp "$PATCH".ips "$HACKS_DIR"
    cp "$WHEEL" "$HACKS_DIR/wheel/"
    ln -s "$ROMS_DIR/$ROM" "$HACKS_DIR/$PATCH.zip"
    cp $HACKS_DIR/gamelist.xml $HACKS_DIR/gamelist.xml.bak
    sed -i '$d' $HACKS_DIR/gamelist.xml
    cat $PATCH.xml >> $HACKS_DIR/gamelist.xml
}

function main() {
#
# Project II - Final Fantasy IV
# http://www.romhacking.net/hacks/1659/

NAME="Project II - Final Fantasy IV"
echo $PATCH
cat $PATCH.xml | grep "desc"
ROM="$ROMS_DIR/Final Fantasy II (USA).zip"
echo $ROM
}

main
