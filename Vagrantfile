# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "debian/jessie64"
  config.vm.network "forwarded_port", guest: 8080, host: 80, auto_correct: true

  config.vm.network "private_network", ip: "192.168.56.15"

  config.vm.provider "virtualbox" do |v|
    # Don't boot with headless mode
    v.gui = false

    # Use VBoxManage to customize the VM. For example to change memory:
    v.customize ["modifyvm", :id, "--memory", "2048"]
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "95"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  # install some base packages
  config.vm.provision :shell, :path => "provision.sh"

  # hostmanager plugin config
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.vm.define 'virtualbox' do |node|
    node.vm.hostname = 'sudoku.local'
    node.vm.network :private_network, ip: '192.168.56.15'
    node.hostmanager
  end
end