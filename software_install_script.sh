#!/bin/bash
declare -a LIST=("vim" "autoconf" "automake" "cmake" "gcc" "gdb" "git" "kile" "kile-l10n" "libtool" "make" "mc" "mesa-utils" "mesa-utils-extra" "qtbase5-dev" "qtcreator" "subversion" "texlive" "texlive-full" "virtualbox" "ghc" "gprolog" "ruby" "bison" "flex" "gfortran" "python-vispy" "python-tk" "python3" "python3-matplotlib" "python3-numpy" "python3-pip" "python3-tk" "python3-venv" "python3-virtualenv" "python3-vispy" "virtualenv" "virtualbox" "virtualbox—ext–pack")

if [[ $EUID -ne 0 ]];
then
  echo "Proszę uruchomić skrypt jako root."
  exit
else
    apt update
    for s in $LIST
    do
        echo "Installing $s\n"
        apt install -y $s; 
    done
    apt full-upgrade -y
fi
