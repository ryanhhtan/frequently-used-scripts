#!/bin/bash

## run as root or with sudo
[[ $(id -u) -ne 0 ]] && {
  echo "please run as root or by sudo."
  exit
}

## update apt-get repository
apt-get update && apt-get upgrade -y 

## install basic tools: make, gcc, zip, unzip and pass
apt-get install make gcc zip unzip pass -y

## install docker and docker-compose
apt-get install docker.io docker-compose -y
usermod -aG docker vagrant

## install docker-credential-pass to store docker credential
VERSION=$(curl -s https://github.com/docker/docker-credential-helpers/releases/latest | grep -Po '(?<=tag/).*(?=")')
echo "fetching docker-credential-helpers: $VERSION"
wget https://github.com/docker/docker-credential-helpers/releases/download/${VERSION}/docker-credential-pass-$VERSION-amd64.tar.gz && tar -xf docker-credential-pass-$VERSION-amd64.tar.gz && chmod +x docker-credential-pass && sudo mv docker-credential-pass /usr/local/bin/

## install nginx
apt-get install nginx -y

## install tmux
apt-get install tmux -y

## install httpie
apt-get install httpie -y

## install ripgrep
apt-get install ripgrep -y

## install sdkman to vagrant
## and use sdkman to install java,maven,gradle and spring-boot cli
su - vagrant -c '\
  curl -s "https://get.sdkman.io" | bash && \
  source "$HOME/.sdkman/bin/sdkman-init.sh" && \
  sdk install java 8.0.222.j9-adpt
  sdk install maven
  sdk install gradle
  sdk install springboot
'
## install nvm to vagrant
## and use nvm to install nodejs and yarn 
su - vagrant -c 'wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash'
su - vagrant -c '. ${HOME}/.nvm/nvm.sh && nvm install 10.16.3 && npm install -g yarn'

## clean up
apt-get clean
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c
