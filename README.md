# Angus sandbox

This is a virtual environment which radically reduces the time spent HLF chaincode development.
It contains a well-configured HLF in a working Minikube cluster and other relevant stuff.

## Requirements

This components are required to run the sandbox locally.
- VirtualBox (https://www.virtualbox.org)
- Vagrant (https://vagrantup.com)

## Pre-install steps

These vagrant plugins are optional but can be useful:
- vagrant-vbguest
- vagrant-scp
- vagrant-disksize
You can install these via `vagrant plugin install PLUGIN_NAME` command.

# Install

1. After cloning check out the Vagrantfile and update if it is necessary, especially SSH port.
2. Run `vagrant up` 
3. Grab a coffee
4. Login to vm via `vagrant ssh`
5. Verify whether the HLF was started properly:
- ```
minikube status
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```
- ```
fcli peer channel list
2020-08-14 09:47:43.938 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
Channels peers has joined:
general
```
6. Enjoy!

# Troubleshooting
## minikube didn't start
Run `start-minikube` command


