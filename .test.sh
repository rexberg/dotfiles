#!/usr/bin/env bash

set -x
set -e

for i in $(find . -type f -executable -not -path "./.git/*"); do 
    shellcheck $i
done
