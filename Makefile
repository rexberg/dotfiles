install:
		mkdir -p ~/.cache
		mkdir -p ~/.config
		mkdir -p ~/.local/bin
		mkdir -p ~/.local/share
		cp .bashrc ~/
		cp .bash_profile ~/
		cp .bash_prompt ~/
		cp -R .config ~/
		cp -R .local ~/
		cp -R .vim ~/
		cp .vimrc ~/
		cp .Xresouces ~/

.PHONY: install
