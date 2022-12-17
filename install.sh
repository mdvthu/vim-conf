#!/bin/sh
# Installation script

CONF_DIR="${HOME}/.config"
VIMRC_DIR="${CONF_DIR}/nvim/"

if [ -d $VIMRC_DIR ]; then
  echo $VIMRC_DIR exists. Exiting.
  exit 1
fi

# Copy over the configuration files
cp -r nvim "$CONF_DIR"
# Headless install of the plugins
nvim -c 'PluginInstall' -c 'qa'
