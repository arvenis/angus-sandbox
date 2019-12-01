#!/bin/bash
minikube start --vm-driver=none --apiserver-ips 127.0.0.1 --apiserver-name localhost --kubernetes-version v1.15.6
minikube version
