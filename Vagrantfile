Vagrant.configure("2") do |config|
    config.vm.box = "generic/debian9"
    config.vm.hostname = "angus-vm"
    config.vm.define "angus-vm"
  
    config.vm.network "forwarded_port", guest: 18888, host: 18888
    config.vm.network "forwarded_port", guest: 8888, host: 8888

    config.vm.provider "virtualbox" do |vb|
      # OSX workaround - disable microphone access
      vb.customize ["modifyvm", :id, "--audio", "none"]
      vb.memory = 4096      
    end

    config.vm.provision "copy-files", type: "file", source: "res", destination: "$HOME/res"
    config.vm.provision "bootstrap", type: "shell", path: "res/bootstrap.sh"
    config.vm.provision "start-minikube", type: "shell", path: "res/start-minikube.sh"
  
  end
