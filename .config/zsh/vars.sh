#!/bin/bash

# Color variables required for the logging/printing. These are provided as the 
# first parameter in the print function.
PRIMARY='\033[36m'
SECONDARY='\033[33m'
TERTIARY='\033[92m'


# Brachs gives us the functionality to create profiles of dotfiles for machines
# main is for macos, linux is for ubuntu etc. read more about this at the .files
# series - https://engineeringwith.kalkayan.io/series/developer-experience/
VAR_DOTFILES_BRANCH="main"


# These are the list of binaries and casks to be installed on the machine, read
# from the following location
VAR_BREW_BINS=( $(cut -d '=' -f1 $HOME/.config/brew/bins.txt) )
VAR_BREW_CASKS=( $(cut -d '=' -f1 $HOME/.config/brew/casks.txt) )


# These are the options defined for the setup script. use the help flag to read
# more details about each of them.
OPT_HELP='--help'
OPT_SETUP_NEW='--new-machine'
OPT_INSTALL_BREW='--install-brew'
OPT_INSTALL_BINS='--install-bins'
OPT_INSTALL_CASKS='--install-casks'
OPT_UPDATE_SHELL='--update-shell'
OPT_WITH_DOTFILES='--with-dotfiles'
OPT_INSTALL_BUILDTOOLS='--install-buildtools'
