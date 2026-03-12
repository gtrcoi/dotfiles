# default programs
export TERM=alacritty
export TERMINAL=alacritty

# add scripts to path
export PATH="$XDG_CONFIG_HOME/scripts:$PATH"

##############
# EDITOR env
##############
if [ -x "/usr/bin/nvim" ]; then
  export EDITOR="nvim"
  export MANPAGER='nvim +Man!'
elif [ -d "$HOME/.var/app/io.neovim.nvim" ]; then
  export EDITOR="flatpak run io.neovim.nvim"
  export MANPAGER="less"
fi

#############
# NVM setup
#############
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.local/share/nvm"
if [ -e /usr/share/nvm/init-nvm.sh ]; then
  source /usr/share/nvm/nvm.sh
  source /usr/share/nvm/bash_completion
  source /usr/share/nvm/install-nvm-exec
fi

# dircolors
if [ -e ~/.dircolors ]; then
  eval 'dircolors ~/.dircolors'
fi

_display_type=$(loginctl show-session self -p Type | awk -F= '{print $2}')
if [ -e /usr/bin/picom ] && [ "$_display_type" = "x11" ] && ! pgrep -x "picom"; then
  picom -b --config $XDG_CONFIG_HOME/picom/picom.conf
fi

restore_wallpaper() {
  _display_type=$(loginctl show-session self -p Type | awk -F= '{print $2}')
  # Wayland
  if [ "$_display_type" = "wayland" ] && command -v swww >/dev/null; then
    swww-daemon >/dev/null 2>&1 &
    swww restore

  # X11
  elif [ "$_display_type" = "x11" ]; then
    if command -v nitrogen >/dev/null; then
      nitrogen --restore &
    elif [ -f "$HOME/.fehbg" ]; then
      sh "$HOME/.fehbg"
    fi
  fi
}

unset _display_type
########################
# Export environment.d
########################
eval $(/lib/systemd/user-environment-generators/30-systemd-environment-d-generator | sed 's/^/export /')
