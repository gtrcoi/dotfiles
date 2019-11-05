#
# ~/.bash_profile
#
## check is running on systemd
if [[ `systemctl` =~ -\.mount ]]; 
then
  # if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  #   exec startx
  # fi
  ## Prompt user to startx
  # checks for ip address in who am i, if not connected over remote do not run
  if [[ -z $DISPLAY && $XDG_VTNR -le 12 && -z  `who am i | cut -f2 -d\( | cut -f1 -d\)` ]]; 
  then
    echo "would you like to start X? (y/n)"
    while true; do
    read REPLY
    case $REPLY in
        [Yy]) exec startx ;;
        [Nn]) break ;;
        *) printf '%s/n' 'Please answer y or n.' ;;
    esac
    done
  fi
fi
[[ -f ~/.bashrc ]] && . ~/.bashrc
