#!/usr/bin/env bash
# This script will link original roms to their patches.

Roms="/home/pi/RetroPie/roms"
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
		echo "Completed linking IPS patches for $System"
		echo "--------------------------------------------"

		for Hack in "$Hacks"/*/*.bps
		do
			Link_To="$Hacks/$(basename "${Base_Game}")/$(basename "${Hack}" .bps).zip"
			echo "$(basename "${Original}")" links to "$(basename "${Link_To}" )"
			ln "$Original" "$Link_To" && echo "$Link_To"
		done
		echo "Completed linking BPS patches for $System."
		echo "--------------------------------------------"

		for Hack in "$Hacks"/*/*.xdelta
		do
			Link_To="$Hacks/$(basename "${Base_Game}")/$(basename "${Hack}" .xdelta).zip"
			echo "$(basename "${Original}")" links to "$(basename "${Link_To}" )"
			ln "$Original" "$Link_To" && echo "$Link_To"
		done
		echo "Completed linking XDELTA patches for $System"
		echo "--------------------------------------------"
	done
}

main
