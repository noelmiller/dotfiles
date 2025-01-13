#!/usr/bin/env bash

# Install brew packages
printf "Installing brew packages...\n"
./.scripts/brew/install_brew_packages

# Install github copilot
printf "Installing github copilot...\n"
./.scripts/github_copilot/install_github_copilot

# Symlink dotfiles
printf "Symlinking dotfiles...\n"
printf "Removing bashrc...\n"
rm -f ~/.bashrc
stow .

# Configure ssh-agent systemd service
printf "Configuring ssh-agent systemd service...\n"
./.scripts/systemd/configure_ssh_agent

# Configure fzf
printf "Configuring fzf...\n"
$(brew --prefix)/opt/fzf/install
