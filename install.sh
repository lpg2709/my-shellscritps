#!/bin/bash

C_BG="\033[1;41m"
C_BG_i="\033[1;44m"
C_C="\033[0m"
FOLDER_NAME="MyShellScripts"
DEFAULT="/opt/$FOLDER_NAME"
DIR=""

_print(){
	if [ $1 = "i" ]; then
		color=${C_BG_i}
	else
		color=${C_BG}
	fi
	printf "${color}$2${C_C}\n"
}

end(){
	printf "\n\n"
	exit
}

checkLastCommand() {
	if [ $? -eq 0 ]; then
		_print "i" "$1 success"
	else
		_print "w" "$1 fail, closing program"
		end
	fi
 }

printf "\n\n"
# Check if root
if [ "$EUID" -ne 0 ]; then
	_print "w" "Please run as root"
	end
fi

read -r -d "" USAGE <<- EOM
Usage: sudo ./install.sh [OPTIONS]

OPTIONS:
  -h            This help screen.
  -c            Configura the path to install.
EOM

if [ "$1" == "-h" ]; then
	echo "$USAGE"
	exit 0
elif [ "$1" == "-c" ];then
	echo "Please enter the path for installation (or informe -d for default folder [$DEFAULT]): "
	read DIR
	if [ "$DIR" == "-d" ];then
		DIR="$DEFAULT"
	fi
else
	DIR="$DEFAULT"
fi

_print "i" "Verify $DIR dir..."
if [ -d "$DIR" ]; then
	_print "w" "Directory found"
	_print "i" "Please delete the directory informed or inform another."
	end
fi

_print "i" "Cloning repository into $DIR"

git clone https://github.com/lpg2709/my-shellscritps.git $DIR
checkLastCommand "Clone repository"

_print "i" "Clean folder $DIR"
rm -rf $DIR/.git $DIR/README.md $DIR/install.sh

_print "i" "\nInstallation finished. Append to your ~/.bashrc"
printf "\n\033[1;36m  export PATH=$DIR:\$PATH${C_C}"
end

