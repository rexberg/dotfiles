install:
		mkdir -p ~/.cache
		mkdir -p ~/.config
		mkdir -p ~/.config/monitor
		mkdir -p ~/.local/bin
		mkdir -p ~/.local/share
		cp .ansible.cfg ~/
		cp .bashrc ~/
		cp .bash_profile ~/
		cp .bash_prompt ~/
		cp -R .config ~/
		cp -R .local ~/
		cp -R .vim ~/
		cp .vimrc ~/
		cp .xinitrc ~/
		cp .xprofile ~/
		cp .Xresources ~/

.PHONY: install
