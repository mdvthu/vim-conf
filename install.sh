#!/bin/sh
# Installation script

# Copy over the configuration files
VIMRC_DIR="${HOME}/.config/nvim/"
cp -r nvim/ "$VIMRC_DIR"

# Headless install of the plugins
nvim -c 'PluginInstall' -c 'qa'
