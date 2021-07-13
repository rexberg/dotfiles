command -v uname >/dev/null 2>&1 && OSTYPE=$(uname)

shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s direxpand
shopt -s dirspell
shopt -s histappend
shopt -s nocaseglob

infocmp xterm-256color >/dev/null 2>&1 && export TERM="xterm-256color"
[ -f $HOME/.bash_prompt ] && source $HOME/.bash_prompt || export PS1="\[\033[38;5;33m\]\u\[\033[0m\] at \[\033[38;5;37m\]\h\[\033[0m\] in \[\e[1;32m\]\w\[\033[0m\]\n$ "
export PATH=$PATH:$HOME/.local/bin
export EDITOR=vim
export PAGER='less -I'
export VISUAL=vim
export WORKON_HOME="$HOME/.local/share/venv"
[ $OSTYPE = "Darwin" ] && export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
[ $OSTYPE = "Darwin" ] && export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv

[ $OSTYPE = "Darwin" ] && alias ll='ls -lhG' || alias ll='ls --color=auto -lh'
alias gd='git diff --color-moved'
alias grep='grep --color=auto'
alias notes='$EDITOR $HOME/.local/share/notes.txt'
alias svnlog='svn log --limit=10'

# bash-completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
	source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
elif [ -f /usr/local/etc/bash_completion ]; then
	source /usr/local/etc/bash_completion
fi
