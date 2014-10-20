#!/bin/bash
#
# Please visit the README for further information
##


shelly_maction(){
	:
}

shelly_admintools(){
	:
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
	echo FUCK YOU!
	return 0
}

shellyRepo_pathAddition(){
	echo "PATH+=\"$1\"" >> $SHELLY_pathFile 

	return 0
}

##
# Module entry
##
shellyRepo_action(){
	for i in ${SHELLY_gitList[*]}; do
		clog 2 "[shellyRepo_action()]" Execute hook "for repo $i"
		${SHELLYR_ACTIONMAP[$i]} || {
			clog 1 "[shellyRepo_action()]" Could not execute function "for repo $i"
			return 1
		}
	done

	return 0
}
