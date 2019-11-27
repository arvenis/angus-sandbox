#!/bin/bash
MINIKUBE_RELEASE=v1.5.2

# Set prompt
echo "export PS1=\"\[\e[1;91m\]\h:\W $\[\e[0m\] \"" >> .bash_profile

# Set LANG environments
echo "LANG=en_US.utf-8" > /etc/environment
echo "LC_ALL=en_US.utf-8" >> /etc/environment

# Install base packages
echo "**** Install base packages ***"
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

# Set node repository
echo "*** Set nodejs repository ***"
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
bash nodesource_setup.sh

# Install docker and kubectl
echo "*** Install docker and kubectl ***"
apt-get update
apt-get install -y -qq docker-ce kubectl nodejs yarn

usermod -aG docker vagrant

# Install and start minikube
echo "*** Install and start minikube ***"
wget -q -O minikube https://storage.googleapis.com/minikube/releases/$MINIKUBE_RELEASE/minikube-linux-amd64
chmod +x minikube
install minikube /usr/local/bin
rm minikube

# Install AWSCLI
echo "*** Install AWSCLI ***"
pip install awscli

# Install aws-iam-authenticator
echo "*** Install aws-iam-authenticator ***"
wget -q -O aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
chmod +x aws-iam-authenticator
mv aws-iam-authenticator /usr/local/bin

# Install helm
echo "*** Install helm ***"
wget -q -O helm.tar.gz https://get.helm.sh/helm-v2.14.0-linux-amd64.tar.gz
tar -zxf helm.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
mv linux-amd64/tiller /usr/local/bin/tiller
rm helm.tar.gz