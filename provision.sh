#!/bin/bash
# Proper header for a Bash script.

sudo apt-get update

# Git
sudo apt-get -y install git

# Ruby Dependancies
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs nginx

# Install nodejs
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install postgres just in case
sudo apt-get -y install postgresql postgresql-contrib

# Setup nginx
sudo rm /etc/nginx/sites-available/default
sudo cp ~/67272/nginx_default_conf /etc/nginx/sites-available/default
sudo chmod 644 /etc/nginx/sites-available/default
sudo service nginx restart

# Install rbenv 
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

# Do not install docs
sudo -H -u vagrant bash -i -c 'printf "gem: --no-rdoc --no-ri\ninstall: --no-rdoc --no-ri\nupdate:  --no-rdoc --no-ri\n" > ~/.gemrc'

# Install Ruby 2.2.5
sudo -H -u vagrant bash -i -c 'rbenv install 2.2.5'
sudo -H -u vagrant bash -i -c 'rbenv global 2.2.5'

# Install bundler
sudo -H -u vagrant bash -i -c 'gem install bundler --no-rdoc --no-ri'
sudo -H -u vagrant bash -i -c 'rbenv rehash'

# Install rails
sudo -H -u vagrant bash -i -c 'gem install rails -v 4.2.7.1 --no-rdoc --no-ri'
sudo -H -u vagrant bash -i -c 'rbenv rehash'

# Set git to use color
sudo -H -u vagrant bash -i -c 'git config --global color.ui true'
sudo -H -u vagrant bash -i -c 'git config --global push.default simple'

echo ''
echo ''
echo '****~~~~~~~~~~~~~~==============~~~~~~~~~~~~~~****'
echo '        67272 VM INSTALL ALL DONE!! YAY :)!       '
echo ' Now you can run `vagrant ssh`. This lets you use '
echo ' the VMs terminal where all the installed programs'
echo ' are. You can still access the `work` files from  '
echo ' your "normal" OS, so for example you can use your'
echo ' favorite IDE to edit the files, then use the VM  '
echo ' to run the programs. Good luck ;)                '
echo '****~~~~~~~~~~~~~~==============~~~~~~~~~~~~~~****'
echo ''

# 67-272 Vagrant Image Provision Script
# 1/18/2017
# Created by Israel Madueme for free use
# 67272 S17