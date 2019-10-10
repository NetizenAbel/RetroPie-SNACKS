#!/usr/bin/env bash

System="./${1}"
Hacks="./${2}"

function main() {
	for Base_Game in $Hacks/*/
	do
		Original="$System/$(basename "${Base_Game}" .zip).zip"

		for Hack in $Hacks/*/*.ips
		do
			Link_To="$Hacks/$(basename "${Base_Game}")/$(basename "${Hack}" .ips).zip"
			rm -f "$Link_To"
			ln "$Original" "$Link_To"
		done
		echo
	done
}

main
