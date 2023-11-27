#!/bin/bash

# Installer
# OS : GNU

php_version="$(curl -sS -kL http://www.php.net/releases?json | jq -r '."8".version' | cut -d '.' -f 1-2)"
wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add -
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/sury-php.list
apt-get update -y
apt-get install -y php${php_version}
apt-get install -y php${php_version}-xml php${php_version}-cli php${php_version}-curl php${php_version}-mbstring
