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
shellyRepo_init(){
	pwd
	local conf="shellyRepoConf.sh"
	. ${conf} || {
		clog 1 "[shellyRepo_init()]" Sourcing of $conf failed
		return 1
	}

	return 0
}

##
# Clones all repos in GIT_REPOLIST, MERCURIAL_REPOLIST
# and SVN_REPOLIST.
##
shellyRepo_dlRepos(){
	local oldpwd=$PWD

	clog 2 "[shellyRepo_dlRepos()]" Downloading git repos.
	cd ~/repos/git
	for i in ${GIT_REPOLIST[*]}; do
		clog 2 "[shellyRepo_dlRepos()]" Cloging repo $i.
		git clone ${i} 2> /dev/null || { 
			clog 1 "[shellyRepo_dlRepos()]" Error while cloning repo $i!
			clog 1 "[shellyRepo_dlRepos()]" Maybe already existent?
		}
	done
	
	clog 2 "[shellyRepo_dlRepos()]" Downloading hg repos.
	cd ~/repos/mercurial
	for i in ${MERCURIAL_REPOLIST[*]}; do
		clog 2 "[shellyRepo_dlRepos()]" Cloning repo $i.
		hg clone ${i} 2> /dev/null || { 
			clog 1 "[shellyRepo_dlRepos()]" Error while cloning repo $i!
			clog 1 "[shellyRepo_dlRepos()]" Maybe already existent?
		}
	done
	
	clog 2 "[shellyRepo_dlRepos()]" Downloading srv repos.
	cd ~/repos/svn
	for i in ${SVN_REPOLIST[*]}; do
		clog 2 "[shellyRepo_dlRepos()]" Checkout of repo $i.
		svn checkout ${i} || { 
			clog 1 "[shellyRepo_dlRepos()]" Error while checkout of $i!
			clog 1 "[shellyRepo_dlRepos()]" Maybe already existent?
		}
	done

	cd $OLDPWD_C
	return 0
}

init(){
	shellyRepo_init || {
		clog 1 "[init()]" Could not init shellyRepo!
		exit 1
	}

	shellyRepo_dlRepos || {
		clog 1 "[init()]" Could not download Repos!
		exit 1
	}

	return 0
}

init
