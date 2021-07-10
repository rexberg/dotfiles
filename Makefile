install:
		mkdir ~/.cache
		mkdir ~/.config
		mkdir -p ~/.local/bin
		mkdir -p ~/.local/share
		cp .bashrc ~/
		cp .bash_profile ~/
		cp -R .config ~/
		cp -R .local ~/

.PHONY: install
