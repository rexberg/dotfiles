install:
		mkdir -p ~/.{cache,config}
		mkdir -p ~/.local/{bin,share}
		cp .bashrc ~/
		cp .bash_profile ~/
		cp -R .config ~/
		cp -R .local ~/

.PHONY: install
