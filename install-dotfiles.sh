######## Creating dirs and moving files ########
echo "Creating directories and moving files..."
mkdir -v ~/bin
mkdir -v ~/.xlock
mkdir -v ~/.i3
cp -v scripts/i3lock.sh ~/bin
cp -v wallpapers/icon.png ~/.xlock
cp -v i3/config ~/.i3
cp -v i3/i3blocks.conf ~/.i3blocks.conf
cp -v misc/Xdefauls ~/.Xdefaults
#################################################

############## Installing packages ##############
echo "Installing packages (vim, i3-gaps deps, urxvt, font-awesome, i3-utils)..."
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev pkg-config i3blocks i3lock ruby-ronn fonts-font-awesome rxvt-unicode-256color vim scrot
#################################################

######## Compiling and installing i3-gaps ########
echo "Cloning i3-gap source..."
git clone https://www.github.com/Airblader/i3 ~/i3-gaps
echo "Changing cwd..."
cd ~/i3-gaps
echo "Compiling i3-gaps..."
make
echo "Installing i3-gaps..."
sudo make install
##################################################

############ Fixing urxvt copy/paste ############
echo "Fixing copy/paste for urxvt..."
curl https://dl.dropboxusercontent.com/u/87084722/urxvtclip.tar.gz -o /usr/lib/urxvt/perl/clipboard.tar.gz | tar zx
#################################################

# Installing vim pathogen and installing gruvbox #
echo "Installing pathogen for vim..."
mkdir -pv ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "Installing colorscheme gruvbox for vim..."
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
##################################################

############ Installing Google Chrome ############
echo "Adding Google Chrome repository..."
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/source.list.d/google-chrome.list
echo "Adding Google Chrome repository signing key..."
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "Updating deb repositories and installing google-chrome-stable..."
sudo apt-get update && sudo apt-get install google-chrome-stable
###################################################

############### Installing Spotify ################
echo "Adding Spotify repository..."
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/source.list.d/spotify.list
echo "Adding Spotify repository signing key..."
sudo apt-key add --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo "Updating deb repositories and installing spotify-client..."
sudo apt-get update && sudo apt-get install spotify-client
###################################################
