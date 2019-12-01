#!/bin/bash
# 0. remove crypto configs
echo "Remove crypto materials..."
rm -rf /etc/hyperledger/fabric/crypto/*
rm -rf /etc/hyperledger/fabric/blocks/*

# 2. generate crypto material
echo "Generate new crypto materials..."
cryptogen generate --output=/etc/hyperledger/fabric/crypto --config=/etc/hyperledger/fabric/config/cluster-config.yaml

# Rename keyfile
echo "Rename keyfile"
mv /etc/hyperledger/fabric/crypto/peerOrganizations/pps.paycap.net/ca/*sk /etc/hyperledger/fabric/crypto/peerOrganizations/pps.paycap.net/ca/ca.pps.paycap.net.key

# 3. generate genesis block for orderer
echo "Generate genesis block..."
configtxgen -profile PpsSingleMSPSolo -channelID orderer-system-channel -outputBlock /etc/hyperledger/fabric/blocks/orderer.genesis.block
# Need for: Orderer

# 4. generate channel configuration transaction
echo "Generate general channel block..."
configtxgen -profile PPsSingleMSPChannel -outputCreateChannelTx /etc/hyperledger/fabric/blocks/general-channel.tx -channelID general
# Need for: peer

# 5. generate anchor transaction
echo "Generate anchor transaction..."
configtxgen -profile PPsSingleMSPChannel -outputAnchorPeersUpdate /etc/hyperledger/fabric/blocks/PeerMSPanchors.tx -channelID general -asOrg PeerMSP
# Need for: peer