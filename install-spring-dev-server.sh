#!/bin/bash

## run as root or with sudo
[[ $(id -u) -ne 0 ]] && {
  echo "please run as root or by sudo."
  exit
}

## install basic tools: make, gcc, zip and unzip
apt install make gcc zip unzip -y

## install docker and docker-compose
apt install docker.io docker-compose -y
usermod -aG docker vagrant

## install nginx
apt install nginx -y

## install basic utilities
apt install httpie tmux -y

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

## apt update and upgrade again
apt-get update && sudo apt-get upgrade -y

## install sdkman
# sudo -u vagrant curl -s "https://get.sdkman.io" | bash
# sudo -u vagrant source "$HOME/.sdkman/bin/sdkman-init.sh"
su vagrant -c 'curl -s "https://get.sdkman.io" | bash'
su vagrant -c 'source "$HOME/.sdkman/bin/sdkman-init.sh"'
## install java dev environment
# sudo -u vagrant sdk install java 8.0.222.j9-adpt
# sudo -u vagrant sdk install maven
# sudo -u vagrant sdk install springboot
# sudo -u vagrant sdk install gradle
su vagrant -c 'sdk install java 8.0.222.j9-adpt'
su vagrant -c 'sdk install maven'
su vagrant -c 'sdk install gradle'
su vagrant -c 'sdk install springboot'

## install nvm
su vagrant -c 'wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash'
su vagrant -c 'source ~/.bashrc'
su vagrant -c 'nvm install 10.16.3'

## clean up
apt-get clean
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c
