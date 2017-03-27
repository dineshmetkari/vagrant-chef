#!/bin/bash

echo "Preparing node..."

# ensure the time is up to date
  apt-get update
  apt-get -y upgrade
  apt-get -y dist-upgrade
  apt-get -y autoremove
  apt-get -y install ntp ntpdate
  service ntp stop
  ntpdate -s time.nist.gov
  service ntp start

  echo "10.1.1.33 ENV["VM_HOSTNAME"] | tee -a /etc/hosts"
