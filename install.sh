#!/usr/bin/env bash
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

[[ -f orig_bashrc ]] || cp ~/.bashrc orig_bashrc

echo "MYCONFIG=`pwd`" > ~/.bashrc
cat orig_bashrc >> ~/.bashrc
cat mybashrc    >> ~/.bashrc

./update.sh
