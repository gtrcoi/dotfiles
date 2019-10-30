# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias cls='clear'

alias dotfiles='/usr/bin/git --git-dir=$HOME/dotstows/.git --work-tree=$HOME/dotstows'
# alias dotfiles-update ='$HOME/.scripts/dotfiles-update.sh'
alias tb='nc termbin.com 9999'
alias wp-city='feh --recursive --random --bg-fill ~/Pictures/Wallpaper/City'
alias wp-tech='feh --recursive --random --bg-fill ~/Pictures/Wallpaper/Technology'
alias wp-nature='feh --recursive --random --bg-fill ~/Pictures/Wallpaper/Nature'
alias wp-fantasy='feh --recursive --random --bg-fill ~/images/Fantasy'


# xclip
alias pbcopy='xclip -selection clipboard' 	# copy to clipboard, ctrl+c, ctrl+shift+c
alias pbpaste='xclip -selection clipboard -o' 	# paste from clipboard, ctrl+v, ctrl+shift+v
alias pbselect='xclip -selection primary -o'	# paste from highlight, middle click, shift+insert

# functions

# custom cd
c() {
	cd $1;
	ls;
}
alias cd="c"

eval "`dircolors /etc/DIR_COLORS`"
