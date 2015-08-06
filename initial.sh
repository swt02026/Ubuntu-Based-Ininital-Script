#!/bin/bash

read -s PASSWORD

echo $PASSWORD | sudo -S apt-get update
sudo apt-get dist-upgrade
#add ppa
PPA=( "ppa:starws-box/deadbeef-player"
	"ppa:webupd8team/java" )

for i in $PPA ; do
	sudo add-apt-repository -y $i
done
#apt-install
sudo apt-get install -y zsh wget curl vim git ssh cmake \
		gcc g++ clang-3.6 llvm-3.6 libclang-dev python-dev vlc \
		ant deadbeef virt-manager  libgtk2.0-dev filezilla \
		qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils \
		build-essential binutils p7zip pbzip2 unzip qemu \
	    libicu-dev python-setuptools libglew-dev libglewmx-dev \
		pcmanx-gtk2 m4 automake autoconf vagrant valgrind \
		libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev yakuake \
		ppa-purge libgmp-dev revolution-r revolution-mkl python-tk \
		python3-pyinotify python3-keyring python3-dev python3-setuptools \
		python3-tk

#pip install
sudo pip install pip numpy

sudo pip install --upgrade virtualenv

sudo pip2 install requests

sudo easy_install3 pip

#install docker
wget -qO- https://get.docker.com/ | sh

sudo usermod -aG docker `whoami`

#powerline font install
mkdir ~/.fonts

git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git ~/.fonts/ubuntu-mono-powerline-ttf

fc-cache -vf

#install oh my zsh
echo "$PASSWORD\n" | sh -c "$(wget https://raw.github.com/swt02026/oh-my-zsh/master/tools/install.sh -O -)"

cp ./.zshrc ~/

#nvm install and update
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

nvm install nvm

nvm install stable

nvm alias default stable

#install java
sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y deadbeef
