#!/bin/bash

#################################################

######## Creating dirs and moving files ########
echo "Creating directories and moving files..."
cp -v misc/zshrc ~/.zshrc
cp -v misc/vimrc ~/.vimrc
#################################################

############## Installing packages ##############
echo "Installing packages (vim, deps, urxvt, font-awesome) etc..."
sudo apt-get install -y pkg-config vim zsh curl weechat unzip
#################################################

######## Installing pathogen and plugins ########
echo "Installing pathogen..."
mkdir -pv ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "Installing colorscheme gruvbox for vim..."
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
echo "Installing syntastic..."
git clone https://github.com/scrooloose/syntastic ~/.vim/bundle/syntastic
echo "Installing vim-airline..."
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
##################################################

##### Installing pip (python package manager) #####
echo "Installing pip (python package manager)..."
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
rm -fv get-pip.py
###################################################

############ Installing rainbowstream ############
echo "Installing rawinbowstream..."
sudo pip install rainbowstream
#fix for rainbowstream crash, cause of the use of sudo
sudo cp /root/.rainbow_config.json ~/
sudo chown markus:markus ~/.rainbow_config.json
###################################################

#################### Oh My Zsh ###################
echo "Installing oh-my-zsh..."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp -v ~/dot-files/misc/headless.zsh-theme ~/.oh-my-zsh/themes
#chsh -s /bin/zsh markus #not working
##################################################
