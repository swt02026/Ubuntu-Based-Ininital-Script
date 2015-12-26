#!/bin/bash

read -s PASSWORD

echo $PASSWORD | sudo -S apt-get update
echo $PASSWORD | sudo -S apt-get dist-upgrade -y
#add ppa
echo $PASSWORD | sudo -S add-apt-repository -y ppa:starws-box/deadbeef-player
echo $PASSWORD | sudo -S add-apt-repository -y ppa:webupd8team/java
echo $PASSWORD | sudo -S apt-get update
#apt-install
echo $PASSWORD | sudo -S apt-get install -y --force-yes zsh wget curl vim git ssh cmake \
		gcc g++ clang-3.7 llvm-3.7 libclang-3.7-dev python-dev vlc \
		ant deadbeef virt-manager  libgtk2.0-dev filezilla \
		qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils \
		build-essential binutils p7zip pbzip2 unzip qemu \
	    libicu-dev python-setuptools libglew-dev libglewmx-dev \
		pcmanx-gtk2 m4 automake autoconf vagrant valgrind \
		libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev python-pip \
		ppa-purge libgmp-dev revolution-r revolution-mkl python-tk \
		python3-pyinotify python3-keyring python3-dev python3-setuptools \
		python3-tk Alacarte atool unrar

#opencv dependence
echo $PASSWORD | sudo -S apt-get install -y --force-yes build-essential libjpeg-dev libtiff5-dev \
		libjasper-dev libopenexr-dev python-numpy \
	   	libtbb-dev yasm libfaac-dev libopencore-amrnb-dev \
	   	libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev \
	   	libx264-dev libqt4-dev libqt4-opengl-dev sphinx-common \
	   	texlive-latex-extra libv4l-dev libdc1394-22-dev libavcodec-dev \
	   	libavformat-dev libswscale-dev cmake-qt-gui at-spi2-core

echo $PASSWORD | sudo -S apt-get install --force-yes -y zlib1g-dev libwebp-dev libpng-dev libgdal-dev gvfs-bin \
	   	 libxine2-dev libeigen3-dev python3-dev python3-numpy ffmpeg clang-format-3.7 \
		 clang-modernize-3.7 llvm-3.7-dev llvm-3.7-tools libllvm3.7 libclang-common-3.7-dev \
		 intltool libnotify-dev libclutter-gtk-1.0-dev libmx-dev libkeybinder-3.0-dev libgee-0.8-dev


#pip install
echo $PASSWORD | sudo -S pip install pip
echo $PASSWORD | sudo -S pip install --upgrade numpy

echo $PASSWORD | sudo -S pip install --upgrade virtualenv

echo $PASSWORD | sudo -S pip2 install requests

echo $PASSWORD | sudo -S easy_install3 pip

#powerline font install
mkdir ~/.fonts

git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git ~/.fonts/ubuntu-mono-powerline-ttf

fc-cache -vf

#install oh my zsh
echo "$PASSWORD\n" | sh -c "$(wget https://raw.github.com/swt02026/oh-my-zsh/master/tools/install.sh -O -)"

cp ./.zshrc ~/

#nvm install and update
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | zsh

. ~/.nvm/nvm.sh

nvm install nvm

nvm install stable

nvm alias default stable

echo $PASSWORD | sudo -S apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo $PASSWORD | sudo -S apt-get update

echo $PASSWORD | sudo -S touch /etc/apt/sources.list.d/docker.list

echo $PASSWORD | sudo -S bash -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" > /etc/apt/sources.list.d/docker.list'

echo $PASSWORD | sudo -S apt-get update

echo $PASSWORD | sudo -S apt-get install docker-engine

echo $PASSWORD | sudo -S service docker start
#remove default openjdk
echo $PASSWORD | sudo -S apt-get remove -y openjdk*
#remove default libreoffice
echo $PASSWORD | sudo -S apt-get remove -y libreoffice*

#for ycmd
cp ./.ycm_extra_conf.py ~/
cp ./.tern-project ~/
#for vim 
curl -o- https://raw.githubusercontent.com/swt02026/.vim/master/install.sh | bash

echo $PASSWORD | sudo -S apt-get autoremove -y

echo $PASSWORD | sudo -S adduser `whoami` kvm

echo $PASSWORD | sudo -S adduser `whoami` libvirtd

echo $PASSWORD | sudo -S adduser `whoami` docker

echo $PASSWORD | sudo -S usermod -aG docker `whoami`

sudo  apt-get install -y oracle-java8-installer oracle-java6-installer oracle-java8-set-default wine1.6 winetricks wine-gecko2.21
