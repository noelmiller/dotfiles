# Purpose

This repo stores all of my dotfiles that I use.

It includes my nushell configuration, zed text editor configuration, and scripts I use for installing my brew packages.

# Setup

## Dependencies

### Installed by default in [Isengard](https://github.com/noelmiller/isengard)

- nushell
- zed

### Brew (use the provided [script](https://github.com/noelmiller/dotfiles/blob/main/.scripts/brew/install_brew_packages) to install)

- carapace
- starship

## Installation Process

```
git clone https://github.com/noelmiller/dotfiles ~/.dotfiles
~/.dotfiles/.scripts/brew/install_brew_packages
cd ~/.dotfiles
stow .
```
