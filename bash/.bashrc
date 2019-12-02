# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add to Path
# Add .scripts
NPATH="$HOME/.scripts"

case ":${PATH}:" in
  *${NPATH}:*) ;;
  *) PATH=$NPATH:${PATH} ;;
esac

# Save globally
export PATH

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
	    . ~/.bash_aliases
fi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# functions

# custom cd
showDirectoryOnChange() {
	cd $1;
	l;
}
alias cd="showDirectoryOnChange"

eval "`dircolors /etc/DIR_COLORS`"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

source ~/.cache/wal/colors-tty.sh
