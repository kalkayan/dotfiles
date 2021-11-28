#!/bin/zsh

# MIT license
#
# Copyright (c) 2020 Manish Sahani
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


# Log
function print () {
    [ $# -eq 2 ] && echo -e "$1$2\033[0m" || echo "$1"
}

# 
function install_xcode () {
    print $SECONDARY "\nVerifying xcode command line tools installation"

    if ! xcode-select -p 2>/dev/null; then
        # Install the xcode command line tools - xcode-select is the eaisest way.
        print $SECONDARY "Installing XCode Command Line tools using default xcode-select"
        xcode-select --install

        # Wait for system to install the command line tools (this is to halt the
        # script until tools aren't installed).
        print $SECONDARY "The Installation is currently in progress, Click Agree on the prompt."
        while ! xcode-select -p 2>/dev/null; do sleep 5; done

        # Verify the installation (the loop will only break when the path for the
        # tools will be found, therefore, no extra verfication needed)
        print $TERTIARY "XCode Command line tools successfully installed."
    fi
}


function print_help () {

    print $SECONDARY "This is the script written to ease out the setup of your development machine. It comes with \nutils to do the tedious work of installing development setup.\n"

    print "  $OPT_HELP                 Print the usage and other options"
    print "  $OPT_SETUP_NEW          The default setup sequence (used generally while setting up a new machine)"
    print "  $OPT_INSTALL_BUILDTOOLS   Install tools and libraries required for necessary language support"
    print "  $OPT_INSTALL_BREW         Install Homebrew (the system package manager)"
    print "  $OPT_UPDATE_SHELL         Update current shell and set it to the latest zsh"
    print "  $OPT_WITH_DOTFILES        Get the latest dotfiles from github"
    print "  $OPT_INSTALL_BINS         Install the binaries specified in bins.txt using brew"
    print "  $OPT_INSTALL_CASKS        Install the casks specified in casks.txt using brew"

    exit
}


function print_banner () {
    # Print information about the project and efforts. Also share a link to the
    # documentation. Print them slowly with 0.4 sec delay between lines.
    print $SECONDARY  "$(cat $HOME/static/message.txt)"
}


function install_brew () {
    [ ! -f "`which brew`" ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" \
                            || brew update && print $SECONDARY "$(brew --version | head -1) is already installed."
}


function update_shell () {
    if [[ " $@ " =~ " --update-shell " ]]; then
        print $SECONDARY "Changing $SHELL to zsh"

        # Install the latest zsh shell
        brew install zsh

        # Chanage the default shell to zsh installed by Homebrew (macos may ship with
        # older version, therefore update the zsh)
        BREW_PREFIX=$(brew --prefix)
        if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
        echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
        chsh -s "${BREW_PREFIX}/bin/zsh";
        fi
    fi
}


function setup_dotfiles () {
    # The trick behind the mangement of dotfiles is cloning it as a bare repository
    # therefore, first, we need to define some arguments for the git command. The
    # location for the dotfiles is under $HOME directory.
    alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
    
    alias

    # Bring the dotfiles from hosted repository if not already present
    if [ ! -d "$HOME/.dotfiles" ]; then
        /usr/bin/git clone --bare https://github.com/kalkayan/dotfiles.git $HOME/.dotfiles
    fi

    # Reset the unstagged changes before updating (TODO: experiment with stash)
    if [[ " $@ " =~ " --dotfiles-reset " ]]; then
        /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME reset --hard
    fi

    # Activate the profile for the current dev machine and Update the dotfiles with
    # remote repository
    /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME config status.showUntrackedFiles no
    /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout $VAR_DOTFILES_BRANCH
    /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME pull origin $VAR_DOTFILES_BRANCH
}


function install_bins () {
    # Brew Binaries - these are binaries that are available as brew formula. A list
    # of these formulas are stored in the bins.txt file under ~/.config/kalkayan
    # ~ Note ~ : this file is automatically updates with everytime brew installs or
    # removes a binary
    bins=( "$@" )

    # required to properly install coreutils
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

    # Install binaries using Homebrew, iterate over bins array and install.
    print $PRIMARY "Installing the following binaries $bins"
    for binary in "${bins[@]}"; do
        # split the brew formula into binary name and version of installation and
        # get the name of the binary (ex- php in php@7.4)
        b=`echo $binary | cut -d \@ -f 1`
        # check if the binary is already present, otherwise install
        if ! brew list --formula | grep "$b" 1>/dev/null; then
            brew install "$binary"
        fi
    done
}

function install_casks () {
    # Brew Casks - these are the casks that are available as brew formula. A list
    # of these casks are stored in the casks.txt under ~/.config/kalkayan folder.
    # ~ Note ~ : this file is automatically updates with everytime brew installs or
    # removes a casks
    casks=( "$@" )

    # required to properly install coreutils
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

    print $PRIMARY "Installing the following casks $casks"

    # Install casks using Homebrew, iterate over casks array and install.
    for c in "${casks[@]}"; do
        print $PRIMARY "$c"
        # first, check if the cask is present or not, if not install
        if ! brew list --cask | grep "$c" 1>/dev/null; then
            brew install --cask "$c"
        fi

    done

}


function ask_password () {
    print $TERTIARY "\nEnter your password to begin with the installation\n"

    # Ask for sudo beforehand, so that the script doesn't halt installation in the
    # later sections.
    sudo -v

    # Keep sudo session persistent, taken from -- https://gist.github.com/cowboy/3118588
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}
