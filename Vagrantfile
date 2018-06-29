# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

    config.vm.box = "vbenes/fedora-25-server"

    config.vbguest.auto_update = true

    # Forward Oracle port
    config.vm.network :forwarded_port, guest: 1521, host: 1521

    config.vm.synced_folder ".", "/home/vagrant/fedora-server",
    :mount_options => ["dmode=777","fmode=666"],
    rsync__exclude: [".git/", ".vagrant/"]
    config.vm.provision :shell, :path => "default-config.sh"


    # Provider-specific configuration so you can fine-tune various backing
    # providers for Vagrant. These expose provider-specific options.
    config.vm.provider :virtualbox do |vb|
        # Use VBoxManage to customize the VM
        vb.customize ["modifyvm", :id,
                                    # Oracle claims to need 512MB of memory available minimum
                                    "--memory", "1024",
                                    # CPU core number
                                    "--cpus", "1",
                                    # Enable DNS behind NAT
                                    "--natdnshostresolver1", "on"]
    end
    
    # This is just an example, adjust as needed
    config.vm.provision :shell, :inline => "echo \"America/Sao_Paulo\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"


end
