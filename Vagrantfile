Vagrant.configure("2") do |config|
    config.vm.box = "generic/debian9"
    config.vm.hostname = "angus-vm"
    config.vm.define "angus-vm"
  
    config.vm.network "forwarded_port", guest: 22, host: 2200, id: "ssh"
    config.vm.provider "virtualbox" do |vb|
      # OSX workaround - disable microphone access
      vb.customize ["modifyvm", :id, "--audio", "none"]
      vb.memory = 4096      
    end
    config.vm.provision "bootstrap", type: "shell", path: "res/bootstrap.sh"
    config.vm.provision "start-minikube", type: "shell", inline: "sudo minikube start --vm-driver=none --apiserver-ips 127.0.0.1 --apiserver-name localhost"
    config.vm.provision "update-files", type: "shell", path: "res/update-files.sh"
    config.vm.provision "copy-charts", type: "file", source: "res/helm/", destination: "helm"
    config.vm.provision "deploy-fabric", type: "shell", inline: "helm upgrade --install fabric helm/fabric-bundle", privileged: false        

    config.vm.post_up_message = <<-MESSAGE
    Well done, amigo! Your Hyperledger Fabric environment is up and running! 
  
    Let's access it via 'vagrant ssh' and verify the environment using 'fcli peer channel list'

    If you got 'general', you can open a bottle, you deserve it! ;-)
        
    MESSAGE
  
  end
