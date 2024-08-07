alias clip="xclip -sel clip"
alias cls="clear"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

###############
# directories
###############
alias aliases="$HOME/.bash_aliases"

######
# cd
######
alias dotfiles="cd $HOME/dotfiles"
alias media="cd '/media/user/4TB HDD'"

#######
# git
#######
alias gits="git status"

#######
# vim
#######
if [ -e "/usr/bin/nvim" ]; then
  alias vim="nvim"
fi

###########
# flatpak
###########
if [ -d "$HOME/.var/app/io.neovim.nvim" ]; then
  alias vim="flatpak run io.neovim.nvim"
fi

# unsorted
