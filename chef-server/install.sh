#!/bin/bash

  apt-get update
  apt-get -y upgrade
  apt-get -y dist-upgrade
  apt-get -y autoremove
  apt-get -y install curl

 # ensure the time is up to date
  echo "Synchronizing time..."
  apt-get -y install ntp ntpdate
  service ntp stop
  ntpdate -s time.nist.gov
  service ntp start

 # download the Chef server package
   echo "Downloading the Chef server package..."
   if [ ! -f /downloads/chef-server-core_12.11.1_amd64.deb ]; then
   wget -nv -P /downloads  https://packages.chef.io/files/stable/chef-server/12.11.1/ubuntu/14.04/chef-server-core_12.11.1-1_amd64.deb
   fi

 # install the package
   echo "Installing Chef server..."
   sudo dpkg -i /downloads/chef-server-core_12.11.1-1_amd64.deb

 # reconfigure and restart services
   echo "Reconfiguring Chef server..."
   sudo chef-server-ctl reconfigure
   echo "Restarting Chef server..."
   sudo chef-server-ctl restart

 # wait for services to be fully available
   echo "Waiting for services..."
   until (curl -D - http://localhost:8000/_status) | grep "200 OK"; do sleep 15s; done
   while (curl http://localhost:8000/_status) | grep "fail"; do sleep 15s; done

 # create admin user
   echo "Creating a user and organization..."
   sudo chef-server-ctl user-create admin Bob Admin admin@4thcoffee.com insecurepassword --filename admin.pem
   sudo chef-server-ctl org-create 4thcoffee "Fourth Coffee, Inc." --association_user admin --filename # 4thcoffee-validator.pem

 # copy admin RSA private key to share
   echo "Copying admin key to /vagrant/secrets..."
   mkdir -p /vagrant/secrets
   cp -f /home/vagrant/admin.pem /vagrant/secrets

  echo "Your Chef server is ready!"
