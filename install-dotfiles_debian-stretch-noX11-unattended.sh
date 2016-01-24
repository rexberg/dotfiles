#!/bin/bash

local_user="$USER"

######## Creating dirs and moving files ########
echo "Creating directories and moving files..."
cp -v misc/zshrc /home/"$local_user"/.zshrc
cp -v misc/vimrc /home/"$local_user"/.vimrc
#################################################

############## Installing packages ##############
echo "Installing packages (vim, deps, urxvt, font-awesome) etc..."
sudo apt-get install -y pkg-config vim zsh curl weechat unzip
#################################################

######## Installing pathogen and plugins ########
echo "Installing pathogen..."
mkdir -pv /home/"$local_user"/.vim/autoload /home/"$local_user"/.vim/bundle
curl -LSso /home/"$local_user"/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "Installing colorscheme gruvbox for vim..."
git clone https://github.com/morhetz/gruvbox.git /home/"$local_user"/.vim/bundle/gruvbox
echo "Installing syntastic..."
git clone https://github.com/scrooloose/syntastic /home/"$local_user"/.vim/bundle/syntastic
echo "Installing vim-airline..."
git clone https://github.com/bling/vim-airline /home/"$local_user"/.vim/bundle/vim-airline
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
sudo cp /root/.rainbow_config.json /home/"$local_user"/
sudo chown "$local_user\":\"$local_user" /home/"$local_user"/.rainbow_config.json
###################################################

#################### Oh My Zsh ###################
echo "Installing oh-my-zsh..."
git clone https://github.com/robbyrussell/oh-my-zsh.git /home/"$local_user"/.oh-my-zsh
cp -v /home/"$local_user"/dot-files/misc/headless.zsh-theme /home/"$local_user"/.oh-my-zsh/themes
#chsh -s /bin/zsh markus #not working
##################################################
