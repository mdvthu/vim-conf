#!/bin/bash
# Installation script

CONF_DIR="${HOME}/.config"
VIMRC_DIR="${CONF_DIR}/nvim"

if [ -d "$VIMRC_DIR" ]; then
  echo "$VIMRC_DIR" exists
  read -p "Would you like to replace the current nvim config? " choice
  [[ "$choice" == [Yy]* ]] || { echo exiting; exit 1 ; }
  rm -rf "${VIMRC_DIR}.bak"
  mv -f "${VIMRC_DIR}" "${VIMRC_DIR}.bak"
fi

# Install Vundle
git clone \
  https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

# Copy over the configuration files
cp -r nvim "$CONF_DIR"
# Headless install of the plugins
nvim -c 'PluginInstall' -c 'qa'
