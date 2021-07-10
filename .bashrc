#!/bin/bash

shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s direxpand
shopt -s dirspell
shopt -s histappend
shopt -s nocaseglob

export PS1="\[\033[38;5;33m\]\u\[$(tput sgr0)\] at \[$(tput sgr0)\]\[\033[38;5;37m\]\h\[$(tput sgr0)\] in \[\e[1;32m\]\w\[$(tput sgr0)\] $ "
export PATH=$PATH:$HOME/.local/bin
export EDITOR=vim
export PAGER='less -I'
export VISUAL=vim
export WORKON_HOME="$HOME/.local/share/venv"
infocmp xterm-256color >/dev/null 2>&1 && export TERM="xterm-256color"

alias ll='ls --color=auto -lh'
alias gd='git diff --color-moved'
alias grep='grep --color=auto'
alias notes='$EDITOR $HOME/.local/share/notes.txt'

# bash-completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi
