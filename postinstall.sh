#!/bin/bash
install -v -Dm644 "${SHED_CONTRIBDIR}/vimrc.default" /etc/vimrc.default
if [ ! -e /etc/vimrc ]; then
    install -v -m644 "${SHED_CONTRIBDIR}/vimrc.default" /etc/vimrc
fi
touch ~/.vimrc
