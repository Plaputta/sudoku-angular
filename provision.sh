#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

sudo su

aptitude update -q

# Install nginx, git
aptitude install -q -y -f nginx git

## install node 4.x
/vagrant/vagrant/node_4_x_setup.sh

# Install npm and required packages
aptitude install -q -y -f npm@latest
ln -s /usr/bin/nodejs /usr/bin/node

cd /vagrant
npm install -g gulp gulp-cli

cp /vagrant/vagrant/sudoku.local /etc/nginx/sites-available/sudoku.local

rm -f /etc/nginx/sites-enabled/sudoku.local
ln -s /etc/nginx/sites-available/sudoku.local /etc/nginx/sites-enabled/sudoku.local

# Restart modified services
service nginx restart

npm install

gulp build