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

##
# Workaround for bug which is fixed in 4.3
# see. http://lists.gnu.org/archive/html/bug-bash/2014-10/msg00192.html
# Ubuntu 12.04 (which indeed is supported) still uses 4.2.25...
##
declare -A SHELLYR_hgList
declare -A SHELLYR_gitList
declare -A SHELLYR_svnList

##
# Sources config and
# additional functions executed in shellyRepo()
# Besides that it looks for an function called clog
# in the environment. If it's not found, it creates
# a simplyfied version.
##
shellyRepo_init(){
	local files=(shellyRepoConf.sh shellyRepoActions.sh)

	for i in ${files[*]}; do
		. ${i} || {
			clog 1 "[shellyRepo_init()]" Sourcing of ${i} failed
			return 1
		}
	done

	type clog > /dev/null || {
		echo "[shellyRepo_init()]" Could not find logging function. Will define one!
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
	## ${!<name>[@]} is just the crude way of saying "give me all keys"
	for i in ${!SHELLYR_gitList[@]}; do
		clog 2 "[shellyRepo_dlRepos()]" Cloning repo $i.
		git clone ${i} || { 
			clog 1 "[shellyRepo_dlRepos()]" "Error while cloning repo $i!"
			clog 1 "[shellyRepo_dlRepos()]" Maybe already existent?
		}
	done
	
	clog 2 "[shellyRepo_dlRepos()]" Downloading hg repos.
	cd ~/repos/mercurial
	for i in ${!SHELLYR_hgList[@]}; do
		clog 2 "[shellyRepo_dlRepos()]" Cloning repo $i.
		hg clone ${i} || { 
			clog 1 "[shellyRepo_dlRepos()]" "Error while cloning repo $i!"
			clog 1 "[shellyRepo_dlRepos()]" Maybe already existent?
		}
	done
	
	clog 2 "[shellyRepo_dlRepos()]" Downloading srv repos.
	cd ~/repos/svn
	for i in ${!SHELLYR_svnList[@]}; do
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
		return 1
	}

	shellyRepo_dlRepos || {
		clog 1 "[init()]" Could not download Repos!
		return 1
	}

	shellyRepo_action || {
		clog 1 "[init()]" Could not download Repos!
		return 1
	}

	return 0
}

shellyRepoMain
