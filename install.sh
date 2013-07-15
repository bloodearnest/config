#!/usr/bin/env bash

# configure config directory
echo "MYCONFIG=`pwd`" > ~/.myconfig_path

# first time install?
[ -f orig_bashrc ] || cp ~/.bashrc orig_bashrc
./update.sh

function link_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}" ]; then
        mv $target $target.bak
    fi

    ln -sf ${source} ${target}
}

if [ "$1" = "vim" ]; then
    for i in _vim*
    do
        link_file $i
    done
else
    for i in _*
    do
        link_file $i
    done
fi
