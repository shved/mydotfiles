#!/usr/bin/env bash

# === INSTALL THIGS ===
sudo apt install build-essential cmake python3-dev python3-pip neovim zsh curl nodejs npm yarn jq git

# === VIM ===
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install neovim

mkdir -p $HOME/.config/nvim/colors
cp -f nvim/colors/* $HOME/.config/nvim/colors
cp -f nvim/init.vim $HOME/.config/nvim

nvim +PlugInstall +UpdateRemotePlugins +qa

python3 $HOME/.local/share/nvim/plugged/YouCompleteMe/install.py --go-completer --rust-completer --ts-completer

# === GO ===
sudo apt install golang

# === RUST ===
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# === RUBY ===
wget -O ruby-install-0.7.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz
tar -xzvf ruby-install-0.7.0.tar.gz
cd ruby-install-0.7.0/
sudo make install
cd ..
rm -r ruby-install-0.7.0
rm ruby-install-0.7.0.tar.gz

ruby-install ruby-2.7.0

wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
cd ..
rm -r chruby-0.3.9
rm chruby-0.3.9.tar.gz

# === ZSH ===
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s $(which zsh)

cp -f .zshrc $HOME

# === MISC ===

cp -f ssh/id_rsa.pub $HOME/.ssh
cp -f ssh/config $HOME/.ssh

mkdir -p $HOME/workspace

cp -f .ackrc $HOME
cp -f .gitconfig $HOME
