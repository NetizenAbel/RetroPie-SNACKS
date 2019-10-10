#!/bin/sh

function Link_Original() {
	for Hack in "${i}"/*.ips
	do
		Zip_Dest="${i}/$(basename "${Hack}" .ips).zip"
		echo "Linking ${i} to ${Zip_Dest}"
		ln -sf "\"../megadrive/${i}.zip\"" "\"${Zip_Dest}\""
	done
}

function main() {
	cd ./genh || echo "No Genesis hacks found."
	for i in *
	do
		echo "Linking ../megadrive/${i}.zip to hacks in genh/${i}/"
		Link_Original	
	done
}

main
