Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  
  config.vm.provision "file", source: "setup_1.sh", destination: "setup_1.sh"
  config.vm.provision "file", source: "setup_2.sh", destination: "setup_2.sh"  
  config.vm.provision :shell, path: "provision.sh", privileged: false
  
  config.vm.network "private_network", ip: "10.40.93.117"
  
  config.vm.synced_folder "shared/", "/home/vagrant/shared"

  config.vm.network "forwarded_port", guest: 8080, host: 10000
  config.vm.network "forwarded_port", guest: 4200, host: 4200
  config.vm.network "forwarded_port", guest: 3000, host: 3000
   
  config.vm.provider "virtualbox" do |v|
	v.memory = 4096
  end
end

