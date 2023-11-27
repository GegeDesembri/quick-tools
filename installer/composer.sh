#!/bin/bash

# Installer
# App: Composer
# OS: Debian
# Requirement: PHP 7.2.5 or above for the latest version.

if ! which php &>/dev/null; then
  echo -e "Please install PHP first..."
  exit 1
else
  php_version="$(php -v | head -1 | awk '{print$2}' | cut -d "." -f 1-2)"
  echo -e "PHP Version ${php_version} installed"
fi

# Install PHP Module Requirements
function php_module(){
  php_version="$(php -v | head -1 | awk '{print$2}' | cut -d "." -f 1-2)"
  module_name="${1}"
  apt-get install -y php${php_version}-${module_name}
}
php_module curl
php_module cli
php_module xml
php_module mbstring

# Download Composer Installer
curl -sS https://getcomposer.org/installer -o ~/composer-setup.php
hash_file="$(sha384sum ~/composer-setup.php | awk '{print $1}')"
hash_sign="$(curl -sS https://composer.github.io/installer.sig)"

# Install Composer
if [[ "${hash_file}" == "${hash_sign}" ]]; then
  echo -e "Installing..."
  php composer-setup.php --install-dir=/usr/local/bin --filename=composer
else
  echo -e "Installer Corrupted"
fi
