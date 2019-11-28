#!/bin/bash
minikube start --vm-driver=none --apiserver-ips 127.0.0.1 --apiserver-name localhost --kubernetes-version v1.15.6
minikube version
minikube update-context

mkdir /home/vagrant/.kube
sed 's/root/home\/vagrant/g' /root/.kube/config > /home/vagrant/.kube/config
chown -R vagrant:vagrant /home/vagrant/.kube

cp -r /root/.minikube /home/vagrant
chown -R vagrant:vagrant /home/vagrant/.minikube
