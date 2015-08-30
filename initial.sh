#!/bin/bash

read -s PASSWORD

echo $PASSWORD | sudo -S apt-get update
sudo apt-get dist-upgrade -y
#add ppa
sudo add-apt-repository -y ppa:starws-box/deadbeef-player
sudo add-apt-repository -y ppa:webupd8team/java
sudo  apt-get update
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
		python3-tk wine1.6 winetricks wine-gecko2.21

#opencv dependence
sudo apt-get install -y build-essential libjpeg-dev libtiff5-dev \
		libjasper-dev libopenexr-dev python-numpy \
	   	libtbb-dev yasm libfaac-dev libopencore-amrnb-dev \
	   	libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev \
	   	libx264-dev libqt4-dev libqt4-opengl-dev sphinx-common \
	   	texlive-latex-extra libv4l-dev libdc1394-22-dev libavcodec-dev \
	   	libavformat-dev libswscale-dev cmake-qt-gui

sudo apt-get install -y zlib1g-dev libwebp-dev libpng-dev libgdal-dev \
	   	 libxine2-dev libeigen3-dev python3-dev python3-numpy ffmpeg

#pip install
sudo pip install pip
sudo pip install --upgrade numpy

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

source ~/.bashrc

nvm install nvm

nvm install stable

nvm alias default stable

#remove default openjdk
sudo apt-get remove -y openjdk*
#remove default libreoffice
sudo apt-get remove -y libreoffice*

#install java
sudo apt-get install -y oracle-java8-installer
#install deadbeef
sudo apt-get install -y deadbeef

sudo apt-get autoremove -y
