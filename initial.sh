#!/bin/bash

read -s PASSWORD

echo $PASSWORD | sudo -S apt-get update
echo $PASSWORD | sudo -S apt-get dist-upgrade -y
#add ppa
echo $PASSWORD | sudo -S add-apt-repository -y ppa:starws-box/deadbeef-player
echo $PASSWORD | sudo -S add-apt-repository -y ppa:webupd8team/java
echo $PASSWORD | sudo -S apt-get update
#apt-install
echo $PASSWORD | sudo -S apt-get install -y zsh wget curl vim git ssh cmake \
		gcc g++ clang-3.7 llvm-3.7 libclang-dev python-dev vlc \
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
echo $PASSWORD | sudo -S apt-get install -y build-essential libjpeg-dev libtiff5-dev \
		libjasper-dev libopenexr-dev python-numpy \
	   	libtbb-dev yasm libfaac-dev libopencore-amrnb-dev \
	   	libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev \
	   	libx264-dev libqt4-dev libqt4-opengl-dev sphinx-common \
	   	texlive-latex-extra libv4l-dev libdc1394-22-dev libavcodec-dev \
	   	libavformat-dev libswscale-dev cmake-qt-gui

echo $PASSWORD | sudo -S apt-get install -y zlib1g-dev libwebp-dev libpng-dev libgdal-dev \
	   	 libxine2-dev libeigen3-dev python3-dev python3-numpy ffmpeg

#pip install
echo $PASSWORD | sudo -S pip install pip
echo $PASSWORD | sudo -S pip install --upgrade numpy

echo $PASSWORD | sudo -S pip install --upgrade virtualenv

echo $PASSWORD | sudo -S pip2 install requests

echo $PASSWORD | sudo -S easy_install3 pip

#install docker
wget -qO- https://get.docker.com/ | sh

echo $PASSWORD | sudo -S usermod -aG docker `whoami`

#powerline font install
mkdir ~/.fonts

git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git ~/.fonts/ubuntu-mono-powerline-ttf

fc-cache -vf

#install oh my zsh
echo "$PASSWORD\n" | sh -c "$(wget https://raw.github.com/swt02026/oh-my-zsh/master/tools/install.sh -O -)"

cp ./.zshrc ~/

#nvm install and update
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | zsh

source ~/.bashrc

nvm install nvm

nvm install stable

nvm alias default stable

#remove default openjdk
echo $PASSWORD | sudo -S apt-get remove -y openjdk*
#remove default libreoffice
echo $PASSWORD | sudo -S apt-get remove -y libreoffice*

#install java
echo $PASSWORD | sudo -S apt-get install -y oracle-java8-installer
#install deadbeef
echo $PASSWORD | sudo -S apt-get install -y deadbeef

echo $PASSWORD | sudo -S apt-get autoremove -y
