Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.network "private_network", ip: "192.168.56.10"
    jenkins.vm.network "forwarded_port", guest: 8080, host: 9090
    jenkins.vm.provision "docker"
    jenkins.vm.provision "shell", path: "provision-jenkins.sh"
  end

  config.vm.define "idempiere" do |idempiere|
    idempiere.vm.network "private_network", ip: "192.168.56.20"
    idempiere.vm.network "forwarded_port", guest: 8080, host: 9080
    idempiere.vm.provision "shell", path: "provision-idempiere.sh"
  end
end
