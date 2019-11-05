# Dotfiles

Stow implementation of rice config.

Dependencies in .pkgdeps. to install with pacman use  
`pacman -S - < .pkgdeps`
___
## To install stow package  
`cd dotfiles`  
`stow -t ~/ [package]`

## To add files to stow package  
Move file to `dotfiles/[package]/` directory then restow file:  
`stow -R [package]`

