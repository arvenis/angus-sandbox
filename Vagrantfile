Vagrant.configure("2") do |config|
    config.vm.box = "generic/debian9"
    config.vm.hostname = "angus-vm"
    config.vm.define "angus-vm"
  
    config.vm.provider "virtualbox" do |vb|
      # OSX workaround - disable microphone access
      vb.customize ["modifyvm", :id, "--audio", "none"]
      vb.memory = 4096      
    end
    config.vm.provision "makedir", type: "shell", inline: "mkdir /opt/resources"
    config.vm.provision "copy-files", type: "file", source: "res", destination: "/opt/resources"
    config.vm.provision "bootstrap", type: "shell", path: "/opt/resources/bootstrap.sh"
    config.vm.provision "preload-images", type: "shell", path: "/opt/resources/preload-images.sh"
    config.vm.provision "start-minikube", type: "shell", path: "/opt/resources/start-minikube.sh"
    config.vm.provision "update-files", type: "shell", path: "/opt/resources/update-files.sh"
    config.vm.provision "deploy-fabric", type: "shell", path: "/opt/resources/deploy-fabric.sh", privileged: false

    config.vm.post_up_message = <<-MESSAGE
    Well done, amigo! 
    
    Congratulations, you've created a working Hyperledger Fabric environment! 
  
    Let's access it via
    
    vagrant ssh
        
    MESSAGE
  
  end
