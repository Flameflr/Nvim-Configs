#! /usr/bin/env bash

# Run when initialsing new nvim setup. It installs all important dependencies

# Install and Setup Neovim

if ! command -v nvim &> /dev/null; then
echo "installing Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.bashrc
sudo rm -rf nvim-linux-x86_64.tar.gz

else
    echo "Neovim already installed. Skipping..."

# Install  and setup JetBrainsMono Nerd font 

if ! fc-list :family | grep -qi "JetBrainsMono Nerd Font"; then
echo "installing JetBrainsMono-Nerd-font..."
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
mkdir -p ~/.local/share/fonts/JetBrainsMono
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
mv *.ttf ~/.local/share/fonts/JetBrainsMono
fc-cache -fv
rm -rf JetBrainsMono.zip

else
    echo "JetBrainsMono-Nerd-font already installed. Skipping..."

# Install nvm to install Node/npm

if ! command -v nvm &> /dev/null; then
echo "installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
source ~/.bashrc

else 
    echo "nvm already installed. Skipping..."
# Message

echo "Installation was successfull!"

echo "Reopening the terminal is required to install node with command: nvm install node



