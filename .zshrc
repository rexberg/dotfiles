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
zstyle ':vcs_info:*' unstagedstr ' %F{purple}[!]%f'
zstyle ':vcs_info:*' stagedstr ' %F{purple}[+]%f'
zstyle ':vcs_info:git:*' formats       '%b%u%c'
zstyle ':vcs_info:git:*' actionformats '%b|%a%u%c'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+=' %F{purple}[?]%f'
    fi
}

precmd() {
	NEWLINE=$'\n'
	vcs_info
	if [[ -z ${vcs_info_msg_0_} ]]; then
		PROMPT='%B%F{blue}%n%f %F{orange}at%f %F{cyan}%m%f %F{orange}in%f %F{green}%~%f${NEWLINE}$%b '
	else
		PROMPT='%B%F{blue}%n%f %F{orange}at%f %F{cyan}%m%f %F{orange}in%f %F{green}%~%f %F{orange}on%f %F{red}${vcs_info_msg_0_}%f ${NEWLINE}$%b '
	fi
}

alias ll="ls -lh --color=always"
alias tree="tree -a -I .git"
alias diff='diff --color=auto'
alias gd='git diff --color-moved'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias svnlog="svn log --verbose --limit 10"
