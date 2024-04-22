alias clip="xclip -sel clip"
alias cls="clear"

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

###########
# flatpak
###########
if [ -d "$HOME/.var/app/io.neovim.nvim" ]; then
  alias vim="flatpak run io.neovim.nvim"
fi

# unsorted
