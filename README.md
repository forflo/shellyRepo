Usage
=====
General considerations
----------------------
You need to adjust your upstream url-links in
shellyRepoConf.sh and let them map to either
the dummy function called "dummy" or to your
custom hook functions that you hopefully defined
in shellyRepoActions.sh where they belong to.

System requirements
-------------------
Before you start init.sh you have to make
sure that your directory structure looks like this:
/home/<user>/repos
                +-git
                +-snv
                +-hg
                
Also be aware of the fact that shellyRepo needs ssh,
git, hg, and subversion to be installed on your system
and that you have to add your local ssh-key to your
repository server if you want to use public key authentication!

Running shellyRepo
------------------
You can either start init.sh locally or as part
of shellyMeta. The latter is currently only recommended
if you're setting up a completely new environment and don't
want to type much.

To start init.sh you just have to type

$ ./init.sh

on your console.

Files
=====

init.sh
-------
Will be sourced by ShellyMeta

shellyRepoConf.sh
-----------------
Will be sourced by init.sh

shellyRepoActions.sh
--------------------
Will be called at the end of init.sh.

Syntax
------

* BEGIN
ACTIONMAP=(
	[<link>]=<functionname>
	<...>
)

<functions mapped to in ACTIONMAP>
