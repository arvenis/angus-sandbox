#!/bin/bash

# Preload docker images to avoid timeout during install
docker pull hyperledger/fabric-tools:1.4.4
docker pull hyperledger/fabric-ca:1.4.4
docker pull hyperledger/fabric-orderer:1.4.4
docker pull hyperledger/fabric-peer:1.4.4
