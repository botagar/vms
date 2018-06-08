# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64"

  config.vm.hostname = "xenial64-dev-personal"
  config.vm.box_check_update = true

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "private_network", ip: "10.10.0.3", name: "VirtualBox Host-Only Ethernet Adapter"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
config.vm.provider "virtualbox" do |vb|
	vb.gui = true
	vb.cpus = 2
	vb.name = "Ubuntu 16.04.4 Dev Personal"
	vb.memory = "2048"
	vb.customize ["modifyvm", :id, "--monitorcount", "1"]
	vb.customize ["modifyvm", :id, "--vram", "128"]
	vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
	vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"] 
	vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
	vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"] 
	vb.customize ["modifyvm", :id, "--vrde", "on"] 
end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
config.vm.provision "shell", inline: <<-SHELL
	useradd jgeddes -m -s /bin/bash
	echo "jgeddes:default" | chpasswd
	sudo chage -d 0 jgeddes
	adduser jgeddes sudo
	id jgeddes

	apt-get update
	apt-get install -y tree wget curl git openssh-server
	apt-get install -y linux-headers-$(uname -r) build-essential dkms   
	apt-get install -y xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
	apt-get install -y firefox 

	wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

	apt-get upgrade -y
	apt-get autoremove -y

	sudo apt-get install -y --no-install-recommends ubuntu-desktop
	apt-get autoremove -y

#	reboot
SHELL
end
