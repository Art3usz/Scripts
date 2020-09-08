#!/bin/bash
LIST=("vim" "autoconf" "automake" "aptitude" "cmake" "gcc" "gdb" "git" "kile" "kile-l10n" "libtool" "make" "mc" "mesa-utils" "mesa-utils-extra" "qtbase5-dev" "qtcreator" "subversion" "texlive" "texlive-full" "virtualbox" "ghc" "gprolog" "ruby" "bison" "flex" "gfortran" "python3-vispy" "python-tk" "python3" "python3-matplotlib" "python3-numpy"  "python2" "python-tk" "python3-tk" "python3-venv" "python3-virtualenv" "python3-vispy" "virtualenv" "g++" "qtbase5-dev-tools" "geany-common" "gimp")

if [[ $EUID -ne 0 ]];
then
  echo "Proszę uruchomić skrypt jako root."
  exit
else
    clear
    apt update
    for index in ${!LIST[*]}
    do
    	echo ''
    	echo ''
    	echo "Installing ${LIST[$index]}"
    	echo ''
	apt install -y ${LIST[$index]}; 
    done
    apt full-upgrade -y
    apt autoclean 
fi
history -c
