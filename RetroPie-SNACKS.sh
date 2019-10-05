#!/usr/bin/env bash

# snes-hacks.sh
#
# RetroPie SN(ES H)ACKS
# A tool for adding recent hacks and updating older ones. This one is for SNES.
#
# Author: kashaiahyah85
# Repository: https://github.com/kashaiahyah85/RetroPie-SNACKS)
# License: MIT https://github.com/kashaiahyah85/RetroPie-SNACKS/blob/master/LICENSE)
#
# Requirements:
# - git
# - sed
# - SNESH as a system in ES

# Variables
readonly ROMS_DIR="/home/pi/RetroPie/roms/snes"
readonly HACKS_DIR="/home/pi/RetroPie/roms/snesh"
export SCRIPT_VERSION="0.1.0" # https://semver.org/
readonly SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
readonly SCRIPT_NAME="$(basename "$0")"
# readonly SCRIPTMODULE_DIR="/opt/retropie/supplementary/[SCRIPTMODULE_NAME]" # Uncomment if you want/need to use a scriptmoodule.
# readonly URL_BASE="https://github.com/kashaiahyah85/RetroPie-SNACKS/raw/devel"

# Dialogs
BACKTITLE="SNACKS: A tool for installing and updating snes hacks."

# dialogYesNo example of usage:
#dialogYesNo "Do you want to continue?"
function dialogYesNo() {
    dialog --no-mouse --backtitle "$BACKTITLE" --yesno "$@" 15 75 2>&1 > /dev/tty
}

# dialogMsg example of usage
#dialogMsg "Failed to install package_name. Try again later."
function dialogMsg() {
    dialog --no-mouse --ok-label "OK" --backtitle "$BACKTITLE" --msgbox "$@" 20 70 2>&1 > /dev/tty
}

# dialogInfo example of usage:
# dialogInfo "Please wait. Compressing $snes_ROM..."
function dialogInfo {
    dialog --infobox "$@" 8 50 2>&1 >/dev/tty
}

# end of dialog functions ###################################################


# Functions ##################################################################

function is_sudo() {
    [[ "$(id -u)" -eq 0 ]]
}

function updatePatches() {
cd $HACKS_DIR || exit
for HACK in ./HACKLIST
    do
        echo wget -c ${HACK} -o ${HACKS_DIR}/ >./HACKSCRIPT
        dialogInfo "Downloading hacks...$(sh ./HACKSCRIPT)"
	done
	
    for HACK in $(cat ./HACKLIST)
    do
        cd "$HACKS_DIR" || exit
        echo wget -c ${HACK} >./HACKSCRIPT
        dialogInfo "Downloading hacks...$(sh ./HACKSCRIPT)"
	rm -f ./HACKSCRIPT
	cd "$SCRIPT_DIR" || exit
    done
}

function fixDiscNumbers() {
	cd $ROMS_DIR || exit
	for OLD_NAME in "$ROMS_DIR"/*\(Disc\ [0-9]\).chd
	do
		dialogInfo "Fixing filenames for multi-disc games,\nPlease wait..."
		NEW_NAME="${OLD_NAME/\ \(Disc\ /.cd}"
		NEW_NAME="${NEW_NAME/\).chd/}"
		dialogInfo "Fixing $NEW_NAMEFixing\nPlease wait..."
		mv "$OLD_NAME" "${NEW_NAME}"
	done
}


function generateM3U() {
	cd $ROMS_DIR || exit
	rm -f $ROMS_DIR/*.m3u
	for ROM_NAME in "$ROMS_DIR"/*.cd[0-9]
	do
		M3U_FILE="${ROM_NAME%.*}.m3u"
		dialogInfo "Generating M3Us ..."
		echo "\"$ROM_NAME\"" >> \
			"$M3U_FILE"
	done
}

function cleanUpCueBins() {
	cd $ROMS_DIR || exit
	for CUE in "$ROMS_DIR"/*.cue
	do
		mv "$CUE" "${CUE%.*}.cuebak"
	done
	for BIN in "$ROMS_DIR"/*.bin
	do
		rm -f "$BIN"
	done
}

function fixGameListXML() {
	cd $ROMS_DIR || exit
	cp $ROMS_DIR/gamelist.xml $ROMS_DIR/gamelist.xml.bak
	sed -e 's/\.cue/.chd/g' \
	    -e 's/\.PBP/.chd/g' \
	    -i $ROMS_DIR/gamelist.xml
}

function main() {
    updatePatches
}

main
