# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export TERMINAL=alacritty

##############
# EDITOR env
##############
if [ -e "/usr/bin/nvim" ]; then
  export EDITOR="nvim"
fi

if [ -d "$HOME/.var/app/io.neovim.nvim" ]; then
  export EDITOR="flatpak run io.neovim.nvim"
fi

export AVALONIA_SCREEN_SCALE_FACTORS=HDMI-0=2.5

#############
# NVM setup
#############
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.local/share/nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec
