#!/bin/sh
git submodule sync
git submodule init
git submodule update
git submodule foreach git pull origin master
git submodule foreach git submodule init
git submodule foreach git submodule update

# install vim modules
vim +BundleInstall +qall

CMDT=_vim/bundle/command-t/ruby/command-t

# build command-t
(cd $CMDT && ruby extconf.rb && make)
