Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end

  project = 'vanilla'
  path = "/var/www/sites/#{project}"

  config.vm.synced_folder ".", "/vagrant", :disabled => true
  config.vm.hostname = "#{project}.dev"
  config.vm.synced_folder ".", "/var/www/sites/deploy_postgres", :nfs => true
  config.ssh.forward_agent  = true
  config.vm.network :private_network, ip: "10.33.36.100"
end
