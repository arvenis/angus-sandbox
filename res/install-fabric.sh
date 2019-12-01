#!/bin/bash
# Remove older files
# rm -rf network/blocks
# rm -rf network/crypto
# rm -rf network/data
# Install fabric components
helm install bootstrap --set hostPath=$(pwd)/network res/helm/bootstrap
helm install fabric-ca res/helm/fabric-ca
helm install fabric-cli res/helm/fabric-cli
helm install fabric-orderer res/helm/fabric-orderer
helm install fabric-peer res/helm/fabric-peer

# Enroll bootstrap identity
kubectl exec -it fabric-ca -- fabric-ca-client enroll -u http://admin:adminpw@localhost:7054