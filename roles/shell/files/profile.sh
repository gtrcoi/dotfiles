# Export environment.d
eval $(/lib/systemd/user-environment-generators/30-systemd-environment-d-generator | sed 's/^/export /')

# default programs
export TERM=alacritty
export TERMINAL=alacritty
export BROWSER="firefox"

# EDITOR env
if [ -x "/usr/bin/nvim" ]; then
  export EDITOR="nvim"
  export MANPAGER='nvim +Man!'
elif [ -d "$HOME/.var/app/io.neovim.nvim" ]; then
  export EDITOR="flatpak run io.neovim.nvim"
  export MANPAGER="less"
fi

# PATH additions
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$XDG_CONFIG_HOME/scripts" ] && PATH="$XDG_CONFIG_HOME/scripts:$PATH"

# dircolors
[ -e "$HOME/.dircolors" ] && eval 'dircolors ~/.dircolors'

# NVM setup
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.local/share/nvm"
if [ -e /usr/share/nvm/init-nvm.sh ]; then
  . /usr/share/nvm/nvm.sh
  . /usr/share/nvm/bash_completion
  . /usr/share/nvm/install-nvm-exec
fi

# picom
_display_type=$(loginctl show-session self -p Type | awk -F= '{print $2}')
if [ -e /usr/bin/picom ] && [ "$_display_type" = "x11" ] && ! pgrep -x "picom"; then
  picom -b --config $XDG_CONFIG_HOME/picom/picom.conf
fi
unset _display_type

# Restore wallpaper
[ -f "$XDG_CONFIG_HOME/shell/wallpaper.sh"] && . "$XDG_CONFIG_HOME/shell/wallpaper.sh"
