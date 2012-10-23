# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  config.vm.box_url = File.dirname(__FILE__) + "/lucid32.box"
  config.vm.host_name = 'catops.ceilingcat.co.uk'
  config.vm.network :hostonly, "192.168.33.10"

  config.vm.customize do |vm|  
    vm.memory_size = 512  
    vm.name = "CFEnv"
  end

  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "lucid32.pp"
  # end
end
