# -*- mode: ruby -*-
# vi: set ft=ruby :

PUPPET_ROOT = "#{File.dirname(__FILE__)}/puppet"

Vagrant::Config.run do |config|
  config.vm.define :workspace do |workspace|
    workspace.vm.box = "precise64"

    workspace.vm.box_url = "http://files.vagrantup.com/precise64.box"
    workspace.vm.host_name = 'workspace.ceilingcat.co.uk'
    workspace.vm.network :hostonly, "192.168.33.10"

    workspace.vm.customize do |vm|  
      vm.memory_size = 512  
      vm.name = "CFEnv"
    end

    workspace.vm.share_folder 'puppet', '/etc/puppet', '../DevOps/puppet'

    workspace.vm.provision :puppet, :module_path => "#{PUPPET_ROOT}/modules" do |puppet|
      puppet.manifests_path = "#{PUPPET_ROOT}/manifests"
      puppet.manifest_file = "precise64.pp"
    end
  end

  config.vm.define :ci do |ci|
    ci.vm.box = "precise64"

    ci.vm.box_url = "http://files.vagrantup.com/precise64.box"
    ci.vm.host_name = 'ci.ceilingcat.co.uk'
    ci.vm.network :hostonly, "192.168.33.2"

    ci.vm.customize do |vm|  
      vm.memory_size = 512  
      vm.name = "CFEnv"
    end

    ci.vm.share_folder 'puppet', '/etc/puppet', '../DevOps/puppet'

    ci.vm.provision :puppet, :module_path => "#{PUPPET_ROOT}/modules" do |puppet|
      puppet.manifests_path = "#{PUPPET_ROOT}/manifests"
      puppet.manifest_file = "precise64.pp"
    end
  end

end
