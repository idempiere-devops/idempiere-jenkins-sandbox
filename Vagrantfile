Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"

  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.provision "docker"
    jenkins.vm.provision "shell", path: "provision-jenkins.sh"
    jenkins.vm.network "forwarded_port", guest: 8080, host: 9090
  end

  config.vm.define "idempiere" do |idempiere|
    idempiere.vm.provision "shell", path: "provision-idempiere.sh"
    idempiere.vm.network "forwarded_port", guest: 8080, host: 8080
  end
end
