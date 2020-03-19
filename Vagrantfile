Vagrant.configure("2") do |config|
    config.vm.box = "generic/debian9"
    config.vm.hostname = "angus-vm"
    config.vm.define "angus-vm"
  
    config.vm.provider "virtualbox" do |vb|
      # OSX workaround - disable microphone access
      vb.customize ["modifyvm", :id, "--audio", "none"]
      vb.memory = 4096      
    end

    config.vm.provision "copy-files", type: "file", source: "res", destination: "$HOME/res"
    config.vm.provision "bootstrap", type: "shell", path: "res/bootstrap.sh"
    config.vm.provision "preload-images", type: "shell", path: "res/preload-images.sh"
    config.vm.provision "start-minikube", type: "shell", path: "res/start-minikube.sh"
    config.vm.provision "update-files", type: "shell", path: "res/update-files.sh"
    config.vm.provision "deploy-fabric", type: "shell", path: "res/deploy-fabric.sh", privileged: false
  
  end
