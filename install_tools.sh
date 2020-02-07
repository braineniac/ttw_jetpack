#!/usr/bin/env bash

source env.sh

install_tools() {
    setup_zsh
    setup_vim
    install_vcstool
}

setup_zsh() {

    # install zsh
    sudo apt install zsh -y

    # create link
    ln -s $SCRIPT_DIR/conf/zshrc ~/.zshrc

    # install oh-my-zsh to ~/.oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    # switch user to zsh
    chsh -s /bin/zsh

}

setup_vim() {

    # install vim
    sudo apt install vim -y

    # create link
    ln -s $SCRIPT_DIR/conf/vimrc ~/.vimrc

    # clone vundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # compile vim packages
    vim +PluginInstall +qa

    # compile YouCompleteMe core
    python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer

}

install_vcstool() {
    sudo apt-get install python3-vcstool
}
