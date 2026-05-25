#! /usr/bin/env bash

# Run when initialsing new nvim setup. It installs all important dependencies

# Install and Setup Neovim

success=0


if ! command -v nvim &> /dev/null; then

    echo ""
    echo "installing Neovim..."
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

    sudo rm -rf /opt/nvim-linux-x86_64
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.bashrc
    sudo rm -rf nvim-linux-x86_64.tar.gz

else
    echo ""
    echo "Neovim already installed. Skipping..."

fi

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
fi

# Install nvm to install Node/npm

if [ ! -s "$HOME/.nvm/nvm.sh" ]; then
    echo "installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    nvm install node

else 
    echo "nvm already installed. Skipping..."

fi

# final checks

if command -v nvim &> /dev/null && cat ~/.bashrc | grep "/opt/nvim-linux-x86_64/bin" &> /dev/null; then

    echo ""
    echo "Neo Vim final Check"
    ((success++))

else
    echo ""
    echo "Neo Vim installation error"

fi

if fc-list :family | grep -qi "JetBrainsMono Nerd Font"; then

    echo "JetBrainsMono-Nerd-font final Check"
    ((success++))

else
    echo "JetBrainsMono-Nerd-font installation error"

fi

if [ -s "$HOME/.nvm/nvm.sh" ] && node -v &> /dev/null; then

    echo "nvm/node final Check"
    ((success++))
    
else
    echo "nvm/node installation error"

fi

# Message
if ((success == 3)); then

    echo "Installation progress finished successfull!"
    echo ""

else
    echo "Installation progress finished with errors!"
    echo ""

fi

exit


