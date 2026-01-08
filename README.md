# Installing Prerequisites

## Install Packages

### Arch Linux

``` shell
pacman -S github-cli
```

# Installing the Dotfiles

``` shell
chezmoi init --apply git@github.com:noelmiller/dotfiles.git
```

# Managing the Dotfiles

``` shell
chezmoi init # Initialize the dotfiles repository (and templates)
chezmoi cd # Change directory to the dotfiles repository
chezmoi add <file> # Add a file to the dotfiles repository
chezmoi edit <file> # Edit a file in the dotfiles repository
chezmoi apply # Apply the dotfiles to the home directory
chezmoi update # Update the dotfiles repository with changes from git
```
