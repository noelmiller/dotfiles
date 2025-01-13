#!/usr/bin/env bash
set -ouex pipefail

# Install brew packages
./.scripts/brew/install_brew_packages

# Install github copilot
./.scripts/github_copilot/install_github_copilot

# Symlink dotfiles
echo "Symlinking dotfiles..."
echo "Removing bashrc..."
rm -f ~/.bashrc
stow .

# Configure ssh-agent systemd service
echo "Configuring ssh-agent systemd service..."
./.scripts/systemd/configure_ssh_agent
