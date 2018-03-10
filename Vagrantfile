# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provision :shell, :path => "setup.sh"
  config.vm.provision :shell, :path => "user-setup.sh", :privileged => false
  config.vm.synced_folder "~/Projects", "/home/vagrant/Projects"

  config.vm.provider :virtualbox do |vb, override|
    vb.memory = 2048
  end
end
