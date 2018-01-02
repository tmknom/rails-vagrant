VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/6"
  config.vm.hostname = 'rails-vagrant'
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.provision :shell, path: "provision.sh"
end

