# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.require_plugin "vagrant-vbguest"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  hostname_rand = "#{rand(10..99)}"
  # Set reasonable defaults for CPU / Memory allocation
  config.vm.provider :virtualbox do |vb, override|
    override.vm.box     = 'precise64'
    override.vm.box_url = 'http://files.vagrantup.com/precise64.box'

    vb.customize ["modifyvm", :id, "--memory", 1024]
    vb.customize ["modifyvm", :id, "--cpus", 2]
  end

  config.vm.define :grid do |conf|
    conf.vm.hostname = "slnm-grid-#{hostname_rand}"
    conf.vm.network :private_network, ip: "192.168.50.4"
    config.vm.network :forwarded_port, :host => 4444, :guest => 4444
    conf.vm.provision "shell", path: "bootstrap.sh", args: "-t grid"
  end

  config.vm.define :node do |conf|
    conf.vm.hostname = "slnm-node-#{hostname_rand}"
    conf.vm.network :private_network, ip: "192.168.50.5"
    conf.vm.provision "shell", path: "bootstrap.sh", args: "-t node"
  end

  config.ssh.forward_x11 = true

end
