#!/bin/sh

. ./lp-utils.sh

if [ "$(IsRoot)" -eq 0 ]; then
	echo "Run this script as root"
	exit 1
fi

# update the packages before doing anything
apt-get update

apt-get install ubuntu-restricted-extras

# allows to play encrypted DVDs
apt-get install libdvdread4 vim htop gparted hardinfo

# install compressing tools
apt-get install unace p7zip-rar sharutils rar arj lunzip lzip

# install development stuff
apt-get install python python3 build-essential guake git

# install Synapse launcher
#add-apt-repository ppa:synapse-core/ppa
#apt-get update
AddPPA synapse-core/ppa
apt-get install synapse

# install Sublime Text 2
#add-apt-repository ppa:webupd8team/sublime-text-2
#apt-get update
#apt-get --purge remove sublime-text*
AddPPA webupd8team/sublime-text-2
apt-get install sublime-text

# install webupd8 repository
#add-apt-repository ppa:nilarimogard/webupd8
#apt-get update
AddPPA nilarimogard/webupd8
apt-get install youtube-dl

# install terminator gnome terminal
./install-terminator-terminal.sh

#######################################################
# auto remove unnecessary packages
apt-get autoremove
