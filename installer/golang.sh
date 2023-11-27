#!/bin/bash

# Run this script as root user
# Golang Version : latest

# Install Golang
golang_version="$(curl -sS -kL https://golang.org/VERSION?m=text | head -1)"
golang_arch="$(dpkg --print-architecture)"
golang_link="https://dl.google.com/go/${golang_version}.linux-${golang_arch}.tar.gz"
wget -O golang.tar.gz "${golang_link}"
rm -rf /usr/local/go
tar -zxvf golang.tar.gz -C /usr/local/
rm -rf golang.tar.gz
echo "export PATH=/usr/local/go/bin:${PATH}" | tee /etc/profile.d/go.sh
source /etc/profile.d/go.sh

# Verify Installation
go version && echo -e "Golang Installed" || echo -e "Golang failed to install"
go env && echo -e "Golang Env Installed" || echo -e "Golang Env failed to install"
