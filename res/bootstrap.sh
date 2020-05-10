#!/bin/bash
MINIKUBE_RELEASE=v1.8.2
NODE_RELEASE=12.x
HELM_RELEASE=3.0.0

# Suppress warning messages
export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
export DEBIAN_FRONTEND=noninteractive

# Install base packages
echo "**** Install base packages ***"
apt-get update
apt-get install -y -qq apt-transport-https ca-certificates curl socat gnupg2 software-properties-common whois python-pip

# Set docker repository
echo "*** Set docker repository ***"
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-cache policy docker-ce

# Set kubectl repository
echo "*** Set kubectl repository ***"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

# Set yarn repository
echo "*** Set yarn repository ***"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Install nvm and node
echo "*** Set nodejs repository ***"
curl -sL https://deb.nodesource.com/setup_$NODE_RELEASE -o nodesource_setup.sh
bash nodesource_setup.sh
rm nodesource_setup.sh

# Install docker and kubectl
echo "*** Install docker and kubectl ***"
apt-get update
apt-get install -y -qq docker-ce kubectl nodejs yarn

usermod -aG docker vagrant

# Install minikube
echo "*** Install and start minikube ***"
wget -q -O minikube https://storage.googleapis.com/minikube/releases/$MINIKUBE_RELEASE/minikube-linux-amd64
chmod +x minikube
install minikube /usr/local/bin
rm minikube

# Install helm
echo "*** Install helm ***"
wget -q -O helm.tar.gz https://get.helm.sh/helm-v$HELM_RELEASE-linux-amd64.tar.gz
tar -zxf helm.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
rm helm.tar.gz
rm -rf linux-amd64