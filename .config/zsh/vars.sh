PRIMARY='\033[36m'
SECONDARY='\033[33m'
TERTIARY='\033[92m'

# Brachs gives us the functionality to create profiles of dotfiles for machines
# main is for macos, linux is for ubuntu etc.
VAR_DOTFILES_BRANCH="main"
VAR_BREW_BINS=( $(cut -d '=' -f1 $HOME/.config/brew/bins.txt) )
VAR_BREW_CASKS=( $(cut -d '=' -f1 $HOME/.config/brew/casks.txt) )


OPT_HELP='--help'
OPT_SETUP_NEW='--new-machine'
OPT_INSTALL_BREW='--install-brew'
OPT_INSTALL_BINS='--install-bins'
OPT_INSTALL_CASKS='--install-casks'
OPT_UPDATE_SHELL='--update-shell'
OPT_WITH_DOTFILES='--with-dotfiles'
OPT_INSTALL_BUILDTOOLS='--install-buildtools'













