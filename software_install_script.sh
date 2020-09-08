#!/bin/bash

function pisz {
    echo ""
    echo ""
    echo $1
    echo ""
}

LIST=("kubuntu-desktop" "vim" "autoconf" "automake" "aptitude" "cmake" "gcc" "gdb" "git" "kile" "kile-l10n" "libtool" "make" "mc" "mesa-utils" "mesa-utils-extra" "qtbase5-dev" "qtcreator" "subversion" "texlive" "texlive-full" "virtualbox" "ghc" "gprolog" "ruby" "bison" "flex" "gfortran" "python3-vispy" "python-tk" "python3" "python3-matplotlib" "python3-numpy"  "python2" "python-tk" "python3-tk" "python3-venv" "python3-virtualenv" "python3-vispy" "virtualenv" "g++" "qtbase5-dev-tools" "geany-common" "gimp" "default-jre" "default-jdk")

if [[ $EUID -ne 0 ]];
then
  echo "Proszę uruchomić skrypt jako root."
  exit
else
    clear
    pisz 'instalacja KDE'
    add-apt-repository ppa:kubuntu-ppa/backports -y
    pisz 'Update repositories'
    apt update
    pisz 'Cleaning'
    apt autoremove -y
    pisz 'instalacja KDE'
    add-apt-repository ppa:kubuntu-ppa/backports
    for index in ${!LIST[*]}
    do
    	
    	pisz "Installing ${LIST[$index]}"
    	apt install -y ${LIST[$index]}; 
    done
    pisz 'Upgrade System'
    apt full-upgrade -y
    
    
    pisz 'Cleaning'
    apt autoremove -y
    aptitude autoclean -y
    apt autoclean -y
    
fi
