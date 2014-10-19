#!/bin/bash
#
# Script that does a complete checkout of all
# git, svn and mercurial repos listed in
# shellyRepoConf.sh. The script assumes that the
# Directory-Structure has already been created 
# by shellyMeta.
#
# Note that this script is intendet to be sourced
# by setup.sh inside of shellyMeta.
##

# Workaround for bug
declare -A SHELLY_ACTIONMAP

##
# Sources config and
# additional functions executed in shellyRepo()
# Besides that it looks for an function called clog
# in the environment. If it's not found, it creates
# a simplyfied version.
##
shellyRepo_init(){
	local conf="shellyRepoConf.sh"
	local actions="shellyRepoActions.sh"

	. ${conf} || {
		clog 1 "[shellyRepo_init()]" Sourcing of $conf failed
		return 1
	}

	. ${actions} || {
		clog 1 "[shellyRepo_init()]" Sourcing of $actions failed
	}

	type clog > /dev/null || {
		clog 1 "[shellyRepo_init()]" Could not find logging function
		function clog(){
			shift
			echo "$@"
			return 0
		}
	}

	return 0
}

##
# Clones all repos in SHELLY_gitList, SHELLY_hgList
# and SHELLY_svnList.
##
shellyRepo_dlRepos(){
	local oldpwd=$PWD

	clog 2 "[shellyRepo_dlRepos()]" Downloading git repos.
	cd ~/repos/git
	for i in ${SHELLY_gitList[*]}; do
		clog 2 "[shellyRepo_dlRepos()]" Cloging repo $i.
		git clone ${i} 2> /dev/null || { 
			clog 1 "[shellyRepo_dlRepos()]" "Error while cloning repo $i!"
			clog 1 "[shellyRepo_dlRepos()]" Maybe already existent?
		}
	done
	
	clog 2 "[shellyRepo_dlRepos()]" Downloading hg repos.
	cd ~/repos/mercurial
	for i in ${SHELLY_hgList[*]}; do
		clog 2 "[shellyRepo_dlRepos()]" Cloning repo $i.
		hg clone ${i} 2> /dev/null || { 
			clog 1 "[shellyRepo_dlRepos()]" "Error while cloning repo $i!"
			clog 1 "[shellyRepo_dlRepos()]" Maybe already existent?
		}
	done
	
	clog 2 "[shellyRepo_dlRepos()]" Downloading srv repos.
	cd ~/repos/svn
	for i in ${SHELLY_svnList[*]}; do
		clog 2 "[shellyRepo_dlRepos()]" Checkout of repo $i.
		svn checkout ${i} || { 
			clog 1 "[shellyRepo_dlRepos()]" "Error while checkout of $i!"
			clog 1 "[shellyRepo_dlRepos()]" Maybe already existent?
		}
	done

	cd $OLDPWD_C
	return 0
}

shellyRepoMain(){
	shellyRepo_init || {
		clog 1 "[init()]" Could not init shellyRepo!
		exit 1
	}

#	shellyRepo_dlRepos || {
#		clog 1 "[init()]" Could not download Repos!
#		exit 1
#	}

	shellyRepo_action || {
		clog 1 "[init()]" Could not download Repos!
	}

	return 0
}

shellyRepoMain
