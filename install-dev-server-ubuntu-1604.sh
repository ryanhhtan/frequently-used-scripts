#!/bin/bash
## update apt-get
sudo apt update
sudo apt upgrade

## install docker and docker-compose
sudo apt install docker.io
sudo apt install docker-compose
sudo usermod -aG docker vagrant

## install nginx
sudo apt install nginx

## install nodejs 12
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install nodejs

## install basic utilities
sudo apt install zip unzip httpie

## install ripgrep
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get update
sudo apt-get install ripgrep

## install latest vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt install vim

## install sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

## install java dev environment
sdk install java 8.0.222.j9-adpt
sdk install maven
sdk install springboot
sdk install gradle

