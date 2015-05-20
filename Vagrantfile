# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative './vagrant/key_authorization'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20131103.box"

  # Providers
  config.vm.provider :virtualbox do |p|
    p.memory = 2048
  end


  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # from http://hakunin.com/six-ansible-practices

  authorize_key_for_user config, "~/.ssh/id_rsa.pub", "~/.ssh/id_dsa.pub"

  {
    'dl'         => '192.168.33.10',
    'w1'         => '192.168.33.11',
    'geoserver'  => '192.168.33.12',
    'sa'         => '192.168.33.13',
  }.each do |short_name, ip|
    config.vm.define short_name do |host|
      host.vm.network 'private_network', ip: ip
      config.sshfs.paths = { "/opt" => "~/remotes/vecnet" }

    end
  end
end
