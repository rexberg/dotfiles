#!/usr/bin/env bash

set -x

for i in $(find . -type f -executable -not -path "./.git/*"); do 
    shellcheck $i
    if [ "$?" -ge 1 ]; then
        echo -e "---\nFailed! $i\n---"
	exit 1
    else
	echo -e "---\nSuccessfully linted $i\n---"
    fi
done
