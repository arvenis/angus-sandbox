#!/bin/bash

minikube update-context

mkdir /home/vagrant/.kube
sed 's/root/home\/vagrant/g' /root/.kube/config > /home/vagrant/.kube/config

cp -r /root/.minikube /home/vagrant

# Set prompt
echo "export PS1=\"\[\e[1;91m\]\h:\W $\[\e[0m\] \"" >> .bashrc
echo "alias fcli='kubectl exec -it fabric-cli --'" >> .bashrc
echo "alias start-minikube='sudo minikube start --vm-driver=none --apiserver-ips 127.0.0.1 --apiserver-name localhost'"

# Set LANG environments
echo "LANG=en_US.utf-8" > /etc/environment
echo "LC_ALL=en_US.utf-8" >> /etc/environment

# Set ownership
chown -R vagrant:vagrant .

# Set timezone
timedatectl set-timezone Europe/Budapest