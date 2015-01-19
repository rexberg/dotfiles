#!/bin/bash
cd ~/.dot-files

rm conkyrc
rm rc.xml
rm menu.xml
rm tint2rc
rm Xdefaults
rm checkpkg.sh

cp ~/.scripts/.checkpkg.sh .
cp ~/.config/openbox/rc.xml .
cp ~/.config/openbox/menu.xml .
cp ~/.config/tint2/tint2rc .
cp ~/.Xdefaults Xdefaults
