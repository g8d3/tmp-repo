#!/usr/bin/env bash

# Aditional system tools
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y nodejs

# sudo apt-get install -y imagemagick
# sudo apt-get install -y libsqlite3-dev sqlite3
sudo apt-get -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
sudo apt-get -y install vim

# Install and configure PostgreSQL Server
sudo apt-get install -y postgresql postgresql-contrib libpq-dev
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"

## Install rbenv and rbenv-build to manage ruby environment
su - vagrant -c "git clone https://github.com/sstephenson/rbenv.git ~/.rbenv"
su - vagrant -c "echo 'export PATH=\"~/.rbenv/bin:$PATH\"' >> ~/.bash_profile"
su - vagrant -c "echo 'eval \"\$(rbenv init -)\"' >> ~/.bash_profile"
su - vagrant -c "git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"

## Install Ruby
su - vagrant -c "rbenv install 2.3.0"
su - vagrant -c "rbenv global 2.3.0"
su - vagrant -c "rbenv rehash"

# Install bundler
su - vagrant -c "gem install bundler"
su - vagrant -c "rbenv rehash"

## Install Rails
su - vagrant -c "gem install rails -v 4.2.6"
su - vagrant -c "rbenv rehash"

# Install and run Redis
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
sudo cp src/redis-server /usr/local/bin/
sudo cp src/redis-cli /usr/local/bin/

## Install Node package manager and dependencies
# sudo apt-get install -y npm
# sudo ln -s /usr/bin/nodejs /usr/bin/node # npm expects nodejs to be called node
# sudo npm install -g npm # Make sure npm gets updated
# sudo npm install -g npm # Run it twice for good measure
# su - vagrant -c "cd /vagrant && npm install" # Expects to find an already initialized package.json in the directory

# NOTE: You will need to bundle install and rake db:setup after everything above finishes
# Also run redis server and sidekiq. Notes on README.md
