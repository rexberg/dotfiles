# options
shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s direxpand
shopt -s dirspell
shopt -s histappend
shopt -s nocaseglob

# envs
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoreboth
infocmp xterm-256color >/dev/null 2>&1 && export TERM="xterm-256color"
[ -f $HOME/.bash_prompt ] && source $HOME/.bash_prompt || export PS1="\[\033[38;5;33m\]\u\[\033[0m\] at \[\033[38;5;37m\]\h\[\033[0m\] in \[\e[1;32m\]\w\[\033[0m\]\n$ "
export PATH=$PATH:$HOME/.local/bin
export EDITOR=vim
export PAGER='less -I'
export VISUAL=vim
export WORKON_HOME="$HOME/.local/share/venv"
export PROJECT_HOME="$HOME/.local/share/venv_projects"
export VIRTUALENVWRAPPER_VIRTUALENV=${HOME}/.local/bin/virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# aliases
alias ls='ls --color=auto'
alias ll='ls --color=auto -lhF'
alias diff='diff --color=auto'
alias gd='git diff --color-moved'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias notes="$EDITOR $HOME/.local/share/notes.txt"
alias svnlog='svn log --limit=10'
alias svngrep="svn log | grep -A1 -B2 $@"
alias cal='cal -w'
alias shrug="echo '¯\_(ツ)_/¯'"
alias vaultd="ansible-vault decrypt --output -"  # Set ANSIBLE_VAULT_PASSWORD_FILE env
alias apt-update-verbose="sudo apt -o'Debug::pkgAcquire::Worker=1' update"
alias bat="bat --style=plain"

# bash-completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
	source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
elif [ -f /usr/local/etc/bash_completion ]; then
	source /usr/local/etc/bash_completion
fi

# ssh-agent
if [ -f ~/.ssh/agent.env ] ; then
	source ~/.ssh/agent.env > /dev/null
	if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
		echo "Stale agent file found. Spawning a new agent."
		eval $(ssh-agent | tee ~/.ssh/agent.env)
		ssh-add
	fi
else
	echo "Starting ssh-agent"
	eval $(ssh-agent | tee ~/.ssh/agent.env)
	ssh-add
fi

# source local modifications
if [ -f ~/.bash_local ]; then
	source ~/.bash_local
fi

# source virtualenvwrapper.sh
if [ -f ${HOME}/.local/bin/virtualenvwrapper.sh ]; then
	source ${HOME}/.local/bin/virtualenvwrapper.sh
fi
