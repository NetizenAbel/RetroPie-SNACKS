#!/usr/bin/env bash

# snes-hacks.sh
#
# RetroPie snes-hacks
# A tool for adding recent hacks and updating older ones. This one is for SNES.
#
# Author: kashaiahyah85
# Repository: https://github.com/kashaiahyah85/RetroPie-snes-hacks)
# License: MIT https://github.com/kashaiahyah85/RetroPie-snes-hacks/blob/master/LICENSE)
#
# Requirements:
# - git
# - sed
# - SNESH as system (for now)

# Globals
# If the script is called via sudo, detect the user who called it and the homedir.
user="$SUDO_USER"
[[ -z "$user" ]] && user="$(id -un)"

home="$(eval echo ~$user)"

# Variables
readonly ROMS_DIR="/home/pi/RetroPie/roms/snes"
readonly HACKS_DIR="/home/pi/RetroPie/roms/snesh"
readonly SCRIPT_VERSION="0.1.0" # https://semver.org/
readonly SCRIPT_DIR="$(cd "$(dirname $0)" && pwd)"
readonly SCRIPT_NAME="$(basename "$0")"
readonly SCRIPT_FULL="$SCRIPT_DIR/$SCRIPT_NAME"
readonly SCRIPT_TEMP="$SCRIPT_DIR/$SCRIPT_NAME/TEMP"
readonly SCRIPT_TITLE="snes-hacks"
readonly SCRIPT_DESCRIPTION="A tool for installing and updating snes hacks."
#readonly SCRIPTMODULE_DIR="/opt/retropie/supplementary/[SCRIPTMODULE_NAME]" # Uncomment if you want/need to use a scriptmoodule.
readonly GIT_REPO_URL="https://github.com/kashaiahyah85/RetroPie-snes-hacks"
readonly GIT_SCRIPT_URL="https://github.com/kashaiahyah85/RetroPie-snes-hacks/blob/master/snes-hacks.sh"
readonly URL_BASE="https://github.com/kashaiahyah85/RetroPie-snes-hacks/raw/devel"

# Dialogs
BACKTITLE="$SCRIPT_TITLE: $SCRIPT_DESCRIPTION"

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
<<<<<<< HEAD
	cd $HACKS_DIR
    for HACK in ./HACKLIST
    do
        echo wget -c ${HACK} -o ${HACKS_DIR}/ >./HACKSCRIPT
        dialogInfo "Downloading hacks...$(sh ./HACKSCRIPT)"
	done
=======
    for HACK in $(cat ./HACKLIST)
    do
        cd "$HACKS_DIR"
        echo wget -c ${HACK} >./HACKSCRIPT
        dialogInfo "Downloading hacks...$(sh ./HACKSCRIPT)"
	rm -f ./HACKSCRIPT
	cd "$SCRIPT_DIR"
    done
>>>>>>> 219af2411c54361391b63918f03dcf7b3e038d30
}

function fixDiscNumbers() {
	cd $ROMS_DIR
	for OLD_NAME in $ROMS_DIR/*\(Disc\ [0-9]\).chd
	do
		dialogInfo "Fixing filenames for multi-disc games,\nPlease wait..."
		NEW_NAME="${OLD_NAME/\ \(Disc\ /.cd}"
		NEW_NAME="${NEW_NAME/\).chd/}"
		dialogInfo "Fixing $NEW_NAMEFixing\nPlease wait..."
		mv "$OLD_NAME" "${NEW_NAME}"
	done
}


function generateM3U() {
	cd $ROMS_DIR
	rm -f $ROMS_DIR/*.m3u
	for ROM_NAME in $ROMS_DIR/*.cd[0-9]
	do
		M3U_FILE="${ROM_NAME%.*}.m3u"
		dialogInfo "Generating M3Us ..."
		echo "\"$ROM_NAME\"" >> \
			"$M3U_FILE"
	done
}

function cleanUpCueBins() {
	cd $ROMS_DIR
	for CUE in $ROMS_DIR/*.cue
	do
		mv "$CUE" "${CUE%.*}.cuebak"
	done
	for BIN in $ROMS_DIR/*.bin
	do
		rm -f "$BIN"
	done
}

function fixGameListXML() {
	cd $ROMS_DIR
	cp $ROMS_DIR/gamelist.xml $ROMS_DIR/gamelist.xml.bak
	sed -e 's/\.cue/.chd/g' \
	    -e 's/\.PBP/.chd/g' \
	    -i $ROMS_DIR/gamelist.xml
}

function main() {
    updatePatches
}

main
