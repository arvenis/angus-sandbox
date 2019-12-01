#!/bin/bash

# 5. Create channel based on general channel
echo "Create general channel..."
peer channel create -o orderer:7050 -c general -f /etc/hyperledger/fabric/blocks/general-channel.tx --outputBlock /etc/hyperledger/fabric/blocks/general.block

# 5. Create channel based on general channel
echo "Join general channel..."
peer channel join -b /etc/hyperledger/fabric/blocks/general.block
