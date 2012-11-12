# -*- mode: ruby -*-
# vi: set ft=ruby :

PUPPET_ROOT = "#{File.dirname(__FILE__)}/puppet"

Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  config.vm.box_url = File.dirname(__FILE__) + "/lucid32.box"
  config.vm.host_name = 'workspace.ceilingcat.co.uk'
  config.vm.network :hostonly, "192.168.33.10"

  config.vm.customize do |vm|  
    vm.memory_size = 512  
    vm.name = "CFEnv"
  end

  config.vm.share_folder 'puppet', '/etc/puppet', '../DevOps/puppet'

  config.vm.provision :puppet, :module_path => "#{PUPPET_ROOT}/modules" do |puppet|
    puppet.manifests_path = "#{PUPPET_ROOT}/manifests"
    puppet.manifest_file = "lucid32.pp"
  end
end
