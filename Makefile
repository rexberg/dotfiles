install:
		cp .bashrc ~/
		cp .bash_profile ~/
		cp -R .config ~/
		cp -R .local ~/

.PHONY: install
