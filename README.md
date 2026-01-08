# Installing Prerequisites

## Install Brew

``` shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

## Install Packages

### Fedora 43

``` shell
sudo dnf install gh
```

# Installing the Dotfiles

``` shell
chezmoi init --apply git@github.com:noelmiller/dotfiles.git --branch fedora
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
