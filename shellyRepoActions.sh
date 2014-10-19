#!/bin/bash
#
# Please visit the README for further information
##

SHELLY_ACTIONMAP=(
	["git@github.com:forflo/Maction.git"]="shelly_maction"
	["git@github.com:forflo/admintools"]="shelly_admintools"
	["git@github.com:forflo/wetL"]="shelly_wetL"
	["git@github.com:forflo/libkact"]="shelly_libkact"
	["git@github.com:forflo/dystruct"]="shelly_dystruct"
	["git@github.com:forflo/libfce"]="shelly_libfce"
	["git@github.com:forflo/bashm"]="shelly_bashm"
	["git@github.com:forflo/basem"]="shelly_basem"
	["git@github.com:forflo/snippetbin.git"]="shelly_snippetbin"
	["git@github.com:forflo/shiny.git"]="shelly_shiny"
	["git@github.com:forflo/libber.git"]="shelly_libber"
	["git@github.com:forflo/millionaer_server.git"]="shelly_millionaer"
	["git@github.com:forflo/erzeuger_verbraucher.git"]="shelly_erzeuger"
	["ssh://florian@klingon.inf.fh-rosenheim.de/srv/git/work"]="shelly_work"
)

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
		${SHELLY_ACTIONMAP[$i]} || {
			clog 1 "[shellyRepo_action()]" Could not execute function "for repo $i"
			return 1
		}
	done

	return 0
}
