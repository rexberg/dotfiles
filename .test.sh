#!/usr/bin/env bash

set -x

build=$(shellcheck install-dotfiles_debian-stretch.sh)

if [ "$?" -ge 1 ]; then
    echo "$build"
    exit 1
fi
