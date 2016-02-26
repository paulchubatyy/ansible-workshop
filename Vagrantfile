# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.provider :virtualbox do |v|
        v.name = "ansible.workshop"
        v.customize [
            "modifyvm", :id,
            "--name", "ansible.workshop",
            "--memory", 1024,
            "--natdnshostresolver1", "on",
            "--cpus", 1,
        ]
    end
    config.vm.box = "ubuntu/trusty64"

    config.vm.network :private_network, ip: "192.168.33.70"
    config.ssh.forward_agent = true
    config.vm.hostname = "ansible.workshop"
    config.hostsupdater.aliases = ["www.ansible.workshop"]
    config.hostsupdater.remove_on_suspend = false
    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "playbook.yml"
        ansible.groups = {
          "database" => ["default"],
          "backend" => ["default"],
          "frontend" => ["default"],
          "workshop:children" => ["database", "backend", "frontend"]
        }
        ansible.limit = 'all'
    end
end
