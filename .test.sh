#!/usr/bin/env bash

for i in $(find . -type f -executable -not -path "./.git/*" ! -name "*.test*" ! -name "*install-dotfiles_ubuntu-trusy_tahr.sh.OUT_OF_DATE*"); do 
    shellcheck "$i"
    if [ "$?" -ge 1 ]; then
		echo -e "---\nFailed! $i\n---"
    else
		echo -e "---\nSucessfully linted $i\n---"
    fi
done
