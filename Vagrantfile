# 67-272 Vagrant Image
# 1/18/2017
# Created by Israel Madueme for free use
# 67272 S17

def provisioned?(vm_name='default', provider='virtualbox')
  File.exist?(".vagrant/machines/#{vm_name}/#{provider}/action_provision")
end

Vagrant.configure(2) do |config|
  unless provisioned?
	  puts 'STOP!!!!!!!!!!!!!!!!!!!!!'
	  puts "Are you sure this (#{Dir.pwd}) is the correct folder you want to create the VM in?"
	  puts "Remember, you should use a folder that is called something like '67272' or '272work' that will"
	  puts "only have git repos, 272 work, and stuff like that. DO NOT run this command if this is your"
	  puts "Documents folder or something (it is OK to have a 272 folder inside your Documents folder though)."
	  puts "Continue? (Type yes or no on the line below to continue or abort)"
	  prompt = STDIN.gets.chomp.downcase
	  
	  unless %w(y yes ya ok).include?(prompt)
	    puts "Ok, move this file (Vagrantfile) and the provision.sh file to a new folder then try again."
	    return
	  end
  end
  
  config.vm.box = 'bento/ubuntu-16.04'
  config.vm.synced_folder '.', '/home/vagrant/67272'
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 3001, host: 3001
  
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = '2048'
    vb.cpus = '2'
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end
  
  config.vm.provision "shell", path: "provision.sh", privileged: false

end