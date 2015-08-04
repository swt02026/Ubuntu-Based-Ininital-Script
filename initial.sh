#!/bin/bash

read -s PASSWORD

echo $PASSWORD | sudo -S apt-get update
sudo apt-get dist-upgrade

PPA=( "ppa:starws-box/deadbeef-player"
	"ppa:webupd8team/java" )

for i in $PPA ; do
	sudo add-apt-repository -y $i
done

sudo apt-get install -y zsh wget curl vim git ssh cmake \
		gcc g++ clang-3.6 llvm-3.6 libclang-dev python-dev vlc \
		ant deadbeef virt-manager \
		qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils \
		build-essential binutils p7zip pbzip2 unzip qemu \
	    libicu-dev python-setuptools libglew-dev libglewmx-dev \
		pcmanx-gtk2 m4 automake autoconf vagrant valgrind \
		libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev yakuake \
		ppa-purge libgmp-dev revolution-r revolution-mkl

pip install pip numpy

wget -qO- https://get.docker.com/ | sh

sudo usermod -aG docker ubuntu

mkdir ~/.fonts     

git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git ~/.fonts/ubuntu-mono-powerline-ttf

fc-cache -vf
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

nvm install nvm 

nvm install stable

nvm alias default stable

sudo apt-get instal -y oracle-java-installer

echo "$PASSWORD\n" | sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
