#!/bin/sh
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

curl -fLo "${script_dir}/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
