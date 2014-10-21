#!/bin/bash
#
# Please visit the README for further information
##


shelly_maction(){
	:
}

shelly_admintools(){
	shellyRepo_pathAdd "~/repos/git/admintools/admin_tools"
	shellyRepo_pathAdd "~/repos/git/admintools/admin_scripts"
	
	return 0
}

shelly_wetL(){
	:
}

shelly_libkact(){
	:
}

shelly_dystruct(){
	:
}

shelly_libfce(){
	:
}

shelly_bashm(){
	:
}

shelly_basem(){
	:
}

shelly_snippetbin(){
	:
}

shelly_shiny(){
	:
}

shelly_libber(){
	:
}

shelly_millionaer(){
	:
}

shelly_erzeuger(){
	:
}

shelly_work(){
	return 0
}

shellyRepo_pathAdd(){
	echo "PATH+=\":$1\"" >> $SHELLYR_pathFile 

	return 0
}

##
# Module entry
##
shellyRepo_action(){
	for i in ${!SHELLYR_gitList[@]}; do
		clog 2 "[shellyRepo_action()]" Execute hook "for repo $i"
		${SHELLYR_gitList[$i]} || {
			clog 1 "[shellyRepo_action()]" Hook "for repo $i failed"
			return 1
		}
	done

	return 0
}
