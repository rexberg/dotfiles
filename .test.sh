#!/usr/bin/env bash

<<<<<<< HEAD
for i in $(find . -type f -executable -not -path "./.git/*" ! -name "*.test*" ! -name "*install-dotfiles_ubuntu-trusy_tahr.sh.OUT_OF_DATE*"); do 
    shellcheck "$i"
    if [ "$?" -ge 1 ]; then
	echo -e "---\nFailed! $i\n---"
    else
	echo -e "---\nSucessfully linted! $i\n---"
=======
set -x

for i in $(find . -type f -executable -not -path "./.git/*"); do 
    shellcheck $i
    if [ "$?" -ge 1 ]; then
        echo -e "---\nFailed! $i\n---"
	exit 1
    else
	echo -e "---\nSuccessfully linted $i\n---"
>>>>>>> 4e7742ab43fc2918e18ad71fb045c0c9fdf7d9d1
    fi
done
