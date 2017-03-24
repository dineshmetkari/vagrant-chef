#!/bin/bash

echo "Preparing node..."

# ensure the time is up to date
  apt-get update
  apt-get -y install ntp
  service ntp stop
  ntpdate -s time.nist.gov
  service ntp start

  echo "10.1.1.33 ENV["VM_HOSTNAME"] | tee -a /etc/hosts"
