Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.provision "docker" do |docker|
      docker.pull_images "ubuntu"
    end
  end

  config.vm.define "idempiere" do |idempiere|
    idempiere.vm.provision "shell", inline: "echo Hello"
  end
end