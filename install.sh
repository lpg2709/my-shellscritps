#!/bin/bash

C_BG="\033[1;41m"
C_BG_i="\033[1;44m"
C_C="\033[0m"

_print(){
	if [ $1 = "i" ]; then
		color=${C_BG_i}
	else
		color=${C_BG}
	fi
	printf "${color}$2${C_C}\n"
}

checkLastCommand() {
	if [ $? -eq 0 ]; then
		_print "i" "$1 success"
	else
		_print "w" "$1 fail, closing program"
		exit -1 
	fi
 }


# Check if root
if [ "$EUID" -ne 0 ]; then
	_print "w" "Please run as root"
	exit
fi

_print "i" "Verify ShellScripts dir..."
if [ ! -d "/opt/ShellScripts" ]; then
	_print "w" "Directory not found"
	_print "i" "Creating ShellScripts dir into /opt"
	make "/opt/ShellScripts"
fi

_print "i" "Cloning repository into ShellScripts/"

git clone https://github.com/lpg2709/my-shellscritps.git /opt/ShellScripts
checkLastCommand "Clone repository"

_print "i" "Modify ~/.bashrc"
echo "export PATH=/opt/ShellScripts/:\$PATH" >> ~/.bashrc
checkLastCommand "Export path to ~/.bashrc"

_print "i" "Instalation finished"
