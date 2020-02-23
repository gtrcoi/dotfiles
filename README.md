# Dotfiles  
Stow implementation of dotfiles.
___
### To install stow package  
`cd dotfiles`  
`stow -t ~/ [package]`

### To add files to stow package  
Move file to `dotfiles/[package]/` directory then restow file:  
`stow -R [package]`
___
### Additional info
Dependencies listed in .pkgdeps.  
To install with pacman use:

`pacman -S --needed - < .pkgdeps`

OR

`pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort .pkgdeps))`
