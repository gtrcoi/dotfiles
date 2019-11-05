# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	        alias ls='ls --color=auto'
		    #alias dir='dir --color=auto'
		        #alias vdir='vdir --color=auto'

			    alias grep='grep --color=auto'
			        alias fgrep='fgrep --color=auto'
				    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias cls='clear'

# Access dotfiles git
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotstows/.git --work-tree=$HOME/dotstows'
# alias dotfiles-update ='$HOME/.scripts/dotfiles-update.sh'

# uploads std in to termbin and return URL
alias tb='nc termbin.com 9999'

# Wallpaper select aliases
alias wp-city='feh --recursive --random --bg-fill ~/Pictures/Wallpaper/City'
alias wp-tech='feh --recursive --random --bg-fill ~/Pictures/Wallpaper/Technology'
alias wp-nature='feh --recursive --random --bg-fill ~/Pictures/Wallpaper/Nature'
alias wp-fantasy='feh --recursive --random --bg-fill ~/images/Fantasy'

# xclip
alias pbcopy='xclip -selection clipboard'       # copy to clipboard, ctrl+c, ctrl+shift+c
alias pbpaste='xclip -selection clipboard -o'   # paste from clipboard, ctrl+v, ctrl+shift+v
alias pbselect='xclip -selection primary -o'    # paste from highlight, middle click, shift+insert

