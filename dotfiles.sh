#!/bin/sh
usage (){ printf "%s [ install | diff ]\n" "$0" && exit 1 ; }
[ -z "${1:-}" ] && usage
if [ $1 = install ]; then for file in .[!.]*; do [ $file != '.git' ] && cp -rv $file ~/; done; exit 0; fi
if [ $1 = diff ]; then for file in .[!.]*; do diff -qr $file ~/$file 2>/dev/null | grep -v 'Only in'; done; exit 0; fi
usage
