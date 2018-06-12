# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.hostname = "xenial64-dev-personal"
  config.vm.box_check_update = true

  config.vm.network "private_network", ip: "10.10.0.3", net_mask: "255.255.0.0", name: "VirtualBox Host-Only Ethernet Adapter"

  # config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"

	config.vm.provider "virtualbox" do |vb|
		vb.gui = true
		vb.cpus = 4
		vb.name = "Ubuntu 16.04.4 Dev Personal"
		vb.memory = "8096"
		vb.customize ["modifyvm", :id, "--monitorcount", "1"]
		vb.customize ["modifyvm", :id, "--vram", "128"]
		vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
		vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"] 
		vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
		vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"] 
		vb.customize ["modifyvm", :id, "--vrde", "on"] 
		vb.customize ["storageattach", :id, "--storagectl", "IDE", "--port", "0", "--device", "1", "--type", "dvddrive", "--medium", "emptydrive"]
	end

	config.vm.provision "UpdateRepo", type: "shell", :inline => "apt-get update"
	config.vm.provision "SetupUsers", type: "shell", path: "scripts/setup_users.sh"
	config.vm.provision "InstallCommandLineTools", type: "shell", path: "scripts/install_linux_utils.sh"
	config.vm.provision "InstallVirtualBoxUtils", type: "shell", path: "scripts/install_vb_utils.sh"
	config.vm.provision "InstallDevelopmentUtils", type: "shell", path: "scripts/install_dev_utils.sh"
	config.vm.provision "SetupMinimalUbuntuDesktop", type: "shell", path: "scripts/setup_minimal_desktop_env.sh"

	config.vm.provision :reload

	config.vm.provision "InstallGnomeTerminal", type: "shell", path: "scripts/install_terminal.sh"
	config.vm.provision "SetDefaultTerminal", type: "shell", path: "scripts/set_default_terminal.sh"
	config.vm.provision "InstallDefaultApps", type: "shell", path: "scripts/install_base_apps.sh"
	config.vm.provision "Cleanup", type: "shell", :inline => "apt-get autoremove -y"	
end
