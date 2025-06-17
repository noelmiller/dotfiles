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
printf "Removing niri config...\n"
rm -f ~/.config/niri/config.kdl
stow .

# Configure ssh-agent systemd service
printf "Configuring ssh-agent systemd service...\n"
./.scripts/systemd/configure_ssh_agent

# Configure niri (only if installed)
if rpm -q niri &>/dev/null; then
    printf "Configuring niri...\n"
    ./.scripts/niri/configure_niri
else
    printf "Skipping niri configuration (package not installed)...\n"
fi