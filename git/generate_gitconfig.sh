#!/bin/sh

if [ -e ~/.gitconfig ]; then
    cp ~/.gitconfig ~/.gitconfig.old
fi

cat ~/.config/git/gitconfig_base          > ~/.gitconfig

if [ "x$OS" = "xWindows_NT" ]; then
    cat ~/.config/git/gitconfig_windows   >> ~/.gitconfig
else
    cat ~/.config/git/gitconfig_linux     >> ~/.gitconfig
fi

if [[ $HOME =~ "74866" ]]; then
    cat ~/.config/git/gitconfig_proxy     >> ~/.gitconfig
fi


    
