#!/bin/bash

## install make and gcc
sudo apt install make -y
sudo apt install gcc -y

## install docker and docker-compose
sudo apt install docker.io -y
sudo apt install docker-compose -y
sudo usermod -aG docker vagrant

## install nginx
sudo apt install nginx -y

## install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
source ~/.bashrc
mvn install 10.16.3

## install basic utilities
sudo apt install zip unzip httpie tmux -y

## install ripgrep
sudo add-apt-repository ppa:x4121/ripgrep << EOF
yes
EOF
sudo apt-get update -y
sudo apt-get install ripgrep -y

## install latest vim
sudo add-apt-repository ppa:jonathonf/vim << EOF

EOF 
sudo apt-get update -y
sudo apt install vim -y

## install sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

## install java dev environment
sdk install java 8.0.222.j9-adpt
sdk install maven
sdk install springboot
sdk install gradle

## final update and upgrade
sudo apt-get update && sudo apt-get upgrade -y

## clean up
# sudo apt-get clean
# sudo dd if=/dev/zero of=/EMPTY bs=1M
# sudo rm -f /EMPTY
# cat /dev/null > ~/.bash_history && history -c
