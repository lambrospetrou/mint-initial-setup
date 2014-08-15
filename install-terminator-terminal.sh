#!/bin/sh

# use the dot (.) operator instead of 'source' for cross-shell compatibility
. ./lp-utils.sh

if [ "$(IsRoot)" -eq 0 ]; then
	echo "Run the script with sudo"
	exit 1
fi

terminatorExists=$( CheckPkgInRepos terminator gnome )

if [ "$terminatorExists" != "1" ]; then
	echo "installing terminator from its own repository"
	#add-apt-repository ppa:gnome-terminator
	#apt-get update
	AddPPA gnome-terminator
	apt-get install terminator
else
	echo "installing terminator from default repositories"
	apt-get install terminator
fi
