#!/bin/bash
[[ $(id -u) -ne 0 ]] && {
  echo "please run as root or by sudo."
  exit
}

## install basic tools: make, gcc, zip and unzip
apt install make gcc zip unzip -y

## install docker and docker-compose
apt install docker.io -y
apt install docker-compose -y
usermod -aG docker vagrant

## install nginx
apt install nginx -y


## install basic utilities
apt install zip unzip httpie tmux -y

## install ripgrep
add-apt-repository ppa:x4121/ripgrep << EOF
yes
EOF
apt-get update -y
apt-get install ripgrep -y

## install latest vim
add-apt-repository ppa:jonathonf/vim << EOF

EOF 
apt-get update -y
apt install vim -y

## final update and upgrade
apt-get update && sudo apt-get upgrade -y

## install sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

## install java dev environment
su vagrant
sdk install java 8.0.222.j9-adpt
sdk install maven
sdk install springboot
sdk install gradle

## install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
source ~/.bashrc
mvn install 10.16.3

## clean up
apt-get clean
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c
