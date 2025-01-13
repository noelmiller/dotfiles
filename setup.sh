#!/usr/bin/env bash
set -ouex pipefail

# Install brew packages
./.scripts/brew/install_brew_packages

# symlink dotfiles
echo "Symlinking dotfiles..."
stow .

# Configure ssh-agent systemd service
echo "Configuring ssh-agent systemd service..."
./.scripts/systemd/configure_ssh_agent
