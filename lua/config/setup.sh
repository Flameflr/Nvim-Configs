#! /usr/bin/env bash

# Run when initialsing new nvim setup. It installs all important dependencies

# Install and Setup Neovim

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.bashrc
sudo rm -rf nvim-linux-x86_64.tar.gz

# Install  and setup JetBrainsMono Nerd font 

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
sudo unzip JetBrainsMono.zip
mv *.ttf ~/.local/share/fonts
fc-cache -v
sudo rm -rf JetBrainsMono.zip

# Install nvm to install Node/npm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
source ~/.bashrc
nvm install-latest-npm 


