setopt autocd extendedglob
unsetopt beep nomatch
bindkey -e

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

EDITOR=/usr/bin/vim
PAGER='/usr/bin/less -I'
VISIUAL=/usr/bin/vim
WORKON_HOME="~/.local/share/venv"
ANSIBLE_VAULT_PASSWORD_FILE="~/git/ansible/vaultpass"

autoload -Uz compinit
compinit

autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' %F{purple}[!]'
zstyle ':vcs_info:*' stagedstr ' %F{purple}[+]'
zstyle ':vcs_info:git:*' formats       '%b%u%c'
zstyle ':vcs_info:git:*' actionformats '%b|%a%u%c'
precmd() {
	local NEWLINE=$'\n'
	vcs_info
	if [[ -z ${vcs_info_msg_0_} ]]; then
		PROMPT='%B%F{blue}%n%f %F{orange}at%f %F{cyan}%m%f %F{orange}in%f %F{green}%~%f${NEWLINE}$%b '
	else
		PROMPT='%B%F{blue}%n%f %F{orange}at%f %F{cyan}%m%f %F{orange}in%f %F{green}%~%f %F{orange}on%f %F{red}${vcs_info_msg_0_}%f ${NEWLINE}$%b '
	fi
}

alias ll="ls -lh --color=always"
alias diff='diff --color=auto'
alias gd='git diff --color-moved'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias svnlog="svn log --verbose --limit 10"
