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
	["https://github.com/forflo/Maction.git"]="shelly_maction"
	["https://github.com/forflo/admintools"]="shelly_admintools"
	["https://github.com/forflo/wetL"]="shelly_wetL"
	["https://github.com/forflo/libkact"]="shelly_libkact"
	["https://github.com/forflo/dystruct"]="shelly_dystruct"
	["https://github.com/forflo/libfce"]="shelly_libfce"
	["https://github.com/forflo/bashm"]="shelly_bashm"
	["https://github.com/forflo/basem"]="shelly_basem"
	["https://github.com/forflo/snippetbin.git"]="shelly_snippetbin"
	["https://github.com/forflo/shiny.git"]="shelly_shiny"
	["https://github.com/forflo/libber.git"]="shelly_libber"
	["https://github.com/forflo/millionaer_server.git"]="shelly_millionaer"
	["https://github.com/forflo/erzeuger_verbraucher.git"]="shelly_erzeuger"
)

SHELLYR_hgList=(
	["https://forflo@bitbucket.org/tartaros/fapr0"]="shelly_fapr0"
	["https://forflo@bitbucket.org/tartaros/tartaros-misc"]="shelly_tarmisc"
)

SHELLYR_svnList=(

)
