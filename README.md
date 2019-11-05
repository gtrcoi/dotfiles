# Dotfiles  
Stow implementation of dotfiles.
___
### To install stow package  
`cd dotfiles`  
`stow -t ~/ [package]`

### To add files to stow package  
Move file to `dotfiles/[package]/` directory then restow file:  
`stow -R [package]`

### Additional info
Dependencies listed in .pkgdeps.  
To install with pacman use:  
`pacman -S - < .pkgdeps`
