#!/bin/bash

IsRootBash() {
	# this is BASH only due to the EUID variable
	if [ $EUID -ne 0 ]; then 
		echo 0; 
	else 
		echo 1; 
	fi
}

IsRoot() {
	if [ "$(id -u)" -ne 0 ]; then 
		echo 0; 
	else 
		echo 1; 
	fi
}

IsVarSet() {
	if [ -z "xxx$1" ]; then echo 0; else echo 1; fi
}

IsVarEmpty() {
	var=$1
	if [ -z "$var" ] || [ "xxx${var}" = "xxx" ]; then echo 1; else echo 0; fi
}

CheckPkgInRepos() {
	#echo "searching repositories for: $*" 
	exists=$( apt-cache search $* )
	if [ "$(IsVarEmpty $exists)" -eq 1 ]; then
		echo 0
	else
		echo 1
	fi
}

CheckPkgInRepos2() {
	#echo "searching repositories for: $*" 
	exists=$( apt-cache search $* )
	if [ -z "xxx${exists}" ]; then
		#echo "exists var is not set"
		echo 0
	elif [ -z "$exists" ] && [ "xxx${exists}" = "xxx" ]; then
		#echo "exists var is set but empty"
		echo 0
	else
		echo 1
	fi
}

AddPPA() {
	# $1 should be the PPA to add
	grep -h "^deb.*$1" /etc/apt/sources.list.d/* > /dev/null 2>&1
	if [ $? -ne 0 ]; then 
		# -y argument will not ask for confirmation
		#add-apt-repository -y ppa:$1
		add-apt-repository ppa:$1
	fi
}


