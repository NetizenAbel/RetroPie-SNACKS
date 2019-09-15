#!/usr/bin/env bash

HACKS_DIR="/pi/RetroPie/roms/snesh"
ROMS_DIR="/pi/RetroPie/roms/snes"
WHEELS_DIR="${HACKS_DIR}/wheel"

#
# Project II - Final Fantasy IV
#
HACK="Project\ II\ -\ Final\ Fantasy\ IV"
ROM="Final\ Fantasy\ II \(USA\).zip"
WHEEL="./wheel/${HACK}.png"
XML="$(cat ${HACK}.xml)"


function installHack (){
    cp "${HACK}.ips" $HACKS_DIR
    cp "$WHEEL" "$WHEELS_DIR"
    ln -s "${ROMS_DIR}/${ROM}" "${HACKS_DIR}/${HACK}.zip"
    cp $HACKS_DIR/gamelist.xml $HACKS_DIR/gamelist.xml.bak
    sed "\'2i\${XML}\\\'" $HACKS_DIR/gamelist.1.xml
}

installHack
