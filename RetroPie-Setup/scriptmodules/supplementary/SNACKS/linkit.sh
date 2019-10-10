#!/usr/bin/env bash
# This script will link original roms to their patches.

Roms="/Users/kashaiahyah85/github/SNACKS/retropiemenu/SNACKS"
#Roms="/home/pi/RetroPie/roms"
System="${Roms}/${1}"
Hacks="${Roms}/${2}"

function main() {
	for Base_Game in "$Hacks"/*/
	do
		Original="$System/$(basename "${Base_Game}" .zip).zip"

		for Hack in "$Hacks"/*/*.ips
		do
			Link_To="$Hacks/$(basename "${Base_Game}")/$(basename "${Hack}" .ips).zip"
			echo "$(basename "${Original}")" links to "$(basename "${Link_To}" )"
			ln "$Original" "$Link_To" && echo "$Link_To"
		done
		echo
	done
}

main
