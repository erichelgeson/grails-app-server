# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?("vagrant-berkshelf")
  raise 'Please install `vagrant plugin install vagrant-berkshelf`'
end

Vagrant.configure(2) do |config|
  config.vm.box = "boxcutter/centos71"
  config.vm.hostname = "grails-app-vagrant"

  # App
  config.vm.network "forwarded_port", guest: 8080, host: 18080
  # Nginx
  config.vm.network "forwarded_port", guest: 8080, host: 10080
  # Postgres
  config.vm.network "forwarded_port", guest: 5432, host: 15432

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end
  config.berkshelf.berksfile_path = "chef-repo/cookbooks/grailsapp/Berksfile"
  config.berkshelf.enabled = true

  config.vm.provision "chef_zero" do |chef|
    chef.install = true
    chef.version = "12.3.0"
    chef.cookbooks_path = "chef-repo/cookbooks"
    chef.roles_path = "chef-repo/roles"
    chef.add_recipe "grailsapp"
    chef.arguments = "--force-formatter"

    chef.json = {
      "grailsapp" => {
        "user" => "vagrant",
        "jar" => "/vagrant/build/libs/grails-app-0.1.jar"
      }
    }
  end
end
