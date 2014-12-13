#!/bin/bash
#
# Path to the paths addition file
##
SHELLYR_pathFile=~/.paths.conf

##
# In the following associative arrays you can map
# a repository and an action.
# Any action must be a function defined in shellyRepoActions
# and any repository, which serves as key, should be an upstream
# URI.
##
SHELLYR_gitList=(
	["https://github.com/forflo/Maction"]="shelly_maction"
	["https://github.com/forflo/admintools"]="shelly_admintools"
	["https://github.com/forflo/wetL"]="shelly_wetL"
	["https://github.com/forflo/libkact"]="shelly_libkact"
	["https://github.com/forflo/dystruct"]="shelly_dystruct"
	["https://github.com/forflo/libfce"]="shelly_libfce"
	["https://github.com/forflo/bashm"]="shelly_bashm"
	["https://github.com/forflo/basem"]="shelly_basem"
	["https://github.com/forflo/snippetbin"]="shelly_snippetbin"
	["https://github.com/forflo/shiny"]="shelly_shiny"
	["https://github.com/forflo/libber"]="shelly_libber"
	["https://github.com/forflo/millionaer_server"]="shelly_millionaer"
	["https://github.com/forflo/erzeuger_verbraucher"]="shelly_erzeuger"
	["https://github.com/forflo/archfai"]="shelly_dummy"
	["https://github.com/forflo/arduino_elsock"]="shelly_dummy"
	["https://github.com/forflo/dmux"]="shelly_dummy"
	["https://github.com/forflo/plapper"]="shelly_dummy"
	["https://github.com/offa/keygen"]="shelly_dummy"
	["https://github.com/forflo/dcmnt_IntroThreading.git"]="shelly_dummy"
	["https://github.com/forflo/sedfuck"]="shelly_dummy"
	["https://github.com/forflo/dcmnt_wiki.git"]="shelly_dummy"
)

#SHELLYR_hgList=(
#	["ssh://hg@bitbucket.org/tartaros/fapr0"]="shelly_fapr0"
#	["ssh://hg@bitbucket.org/tartaros/tartaros-misc"]="shelly_tarmisc"
#)

SHELLYR_svnList=(

)
