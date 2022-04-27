#! /usr/bin/env bash
NVIM_PATH=".config/nvim"
cd nvim/$NVIM_PATH

mkdir -p ~/$NVIM_PATH/plugin

# create symbolic link
for f in `find . -regex ".*\.vim$\|.*\.lua$"`; do
        rm -rf ~/$NVIM_PATH/$f 
        ln -s $(pwd)/$f ~/$NVIM_PATH/$f
done
