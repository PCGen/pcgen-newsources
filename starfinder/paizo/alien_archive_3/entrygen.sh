#!/bin/bash

## SET VARIABLES #########################
count=0
fileselect=()
fileselect+=('none')
RACES=0
ABILITIES=0
ABILITYCATEGORIES=0
CLASSES=0
EQUIP_GEAR=0
EQUIP_MAGIC=0
FEATS=0
DATATABLES=0
EQUIP=0
SPELLS=0
##########################################


for f in ./*.lst; do
	((count++))
	echo "${count}) $f"
	file[$count]="$f"
done

read -p "Which file?" choice
choice=${choice:-0}

fileselect=$("${file[$choice]}" | cut -d'.' -f1 | cut -d'_' -f2- | tr [:upper:] [:lower:])

abilitycategories()
{
	if [ "$getrace" -n ]; then
		read -p "Race:" getrace
		cat <<EOF
1) Fine
2) Diminutive
3) Tiny
4) Small
5) Medium
6) Large
7) Gargantuan
8) Colossal
9) Colossal+
EOF
	fi
	if [ "$getsize" -n ]; then
		read -p "SIZE AND TYPE? [5]: " getsize
		getsize=${getsize:-5}
		case $getsize in
			1)
				SIZE="F";;
			2)
				SIZE="D";;
			3)
				SIZE="T";;
			4)
				SIZE="S";;
			5)
				SIZE="M";;
			6)
				SIZE="L";;
			7)
				SIZE="G";;
			8)
				SIZE="C";;
			9)
				SIZE="P";;
			*)
				echo "number unrecognized"
				exit 0;;
		esac
	fi
	if [ "$sortkey" -n ]; then
		sortkeycount=1
		defaultsortkey="$(echo ${getrace}" | cut -c1)$sortkeycount"

	else
		((sortkeycount++)
		defaultsortkey="$(echo ${getrace}" | cut -c1)$sortkeycount"
	fi
	unset sortkey
	read -p "sortkey? [${defaultsortkey}] " sortkey
	sortkey=${sortkey:-${defaultsortkey}}



}



case ${fileselect} in
	races)
		RACES=1
		;;
	abilities)
		ABILITIES=1
		;;
	abilitycategories)
		ABILITYCATEGORIES=1
		;;
	classes)
		CLASSES=1
		;;
	equip_gear)
		EQUIP_GEAR=1
		;;
	equip_magic)
		EQUIP_MAGIC=1
		;;
	feats)
		FEATS=1
		;;
	datatables)
		DATATABLES=1
		;;
	equip)
		EQUIP=1
		;;
	spells)
		SPELLS=1
		;;
	*)
		echo "Unknown selection"
		exit 0
		;;
esac



