#!/bin/bash
if [ ! -e /etc/vimrc ]; then
    ln -sv /usr/share/defaults/etc/vimrc /etc/vimrc
fi
