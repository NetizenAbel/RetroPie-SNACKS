#!/bin/sh

game.xml > sed s/'{hack}'/"${4}"/ | sed s/'{game\ id}'/"${3}"/ >>"${1}"/"${2}"/gamelist.xml
