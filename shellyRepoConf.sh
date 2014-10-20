#
# The full repolist used by
# init.sh
##


SHELLYR_pathFile=".paths.conf"

##
# In the following associative arrays you can map
# a repository and an action.
# Any action must be a function defined in shellyRepoActions
# and any repository, which serves as key, should be an upstream
# URI.
##
SHELLYR_gitList=(
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

SHELLYR_hgList=(
	["ssh://hg@bitbucket.org/tartaros/fapr0"]="shelly_fapr0"
	["ssh://hg@bitbucket.org/tartaros/tartaros-misc"]="shelly_tarmisc"
)

SHELLYR_svnList=(

)
