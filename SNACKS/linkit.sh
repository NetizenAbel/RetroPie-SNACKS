#!/usr/bin/env bash
# This script will link original roms to their patches.

Home="/home/pi/RetroPie"
System="$Home/roms/${1}"
Hacks="$Home/roms/${2}"

function main() {
	for Base_Game in $Hacks/*/
	do
		Original="$System/$(basename "${Base_Game}" .zip).zip"

		for Hack in $Hacks/*/*.ips
		do
			Link_To="$Hacks/$(basename "${Base_Game}")/$(basename "${Hack}" .ips).zip"
			ln "$Original" "$Link_To" && echo "$Link_To"
		done
		echo
	done
}

main
