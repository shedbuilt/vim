#!/bin/bash
if [ ! -e /etc/vimrc ]; then
    install -v -m644 "${SHED_CONTRIBDIR}/vimrc.default" /etc/vimrc
fi
touch ~/.vimrc
