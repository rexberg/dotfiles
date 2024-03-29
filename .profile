export PATH=$PATH:$HOME/.local/bin
export MANPATH=$MANPATH:$HOME/.local/share/man

# XDG base dirs
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CONFIG_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_DATA_DIRS=$XDG_DATA_DIRS:$HOME/.local/share
