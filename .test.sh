#!/usr/bin/env bash

set -e

for i in $(find . -type f -executable -not -path "./.git/*"); do 
    shellcheck $i && echo -e "---\nSucessfully linted $i\n---"
done
