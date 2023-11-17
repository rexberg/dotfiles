export PATH=$PATH:$HOME/.local/bin
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share

[ -f ~/.bashrc ] && . ~/.bashrc
[ -f ~/.bash_local ] && . ~/.bash_local
