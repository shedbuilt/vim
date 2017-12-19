#!/bin/bash
if [ ! -e /etc/vimrc ]; then
    install -v -m644 /etc/vimrc.default /etc/vimrc
fi
touch ~/.vimrc
