#!/usr/bin/env bash

log_directory='/var/log/selenium/'
type=''

while getopts "t:" name
do
  case $name in
    t)     type="$OPTARG";;
    ?)     printf "Usage: %s: [-t <grid|node>] \n" $0
            exit 2;;
  esac
done

if [[ $type = '' ]]; then
  printf "Usage: %s: [-t <grid|node>] \n" $0
fi

# get apt updates
apt-get update

# install required items
apt-get install -y curl openjdk-7-jdk

# create log folder and a location we can use for the required files
mkdir -p $log_directory
chown -R vagrant:vagrant $log_directory
mkdir -p /opt/selenium

# download selenium standalone to be used for both grid and node(s)
pushd /opt/selenium/
curl -O https://selenium.googlecode.com/files/selenium-server-standalone-2.37.0.jar
ln -s selenium-server-standalone-2.37.0.jar selenium-server-standalone-current.jar

# type specific commands
if [[ $type = 'node' ]]; then
  apt-get install -y xvfb firefox
  cp /vagrant/conf/selenium/nodeConfig.json /opt/selenium/config.json
  cp /vagrant/conf/upstart/selenium-node.conf /etc/init/
  start selenium-node
else
  cp /vagrant/conf/selenium/hubConfig.json /opt/selenium/config.json
  cp /vagrant/conf/upstart/selenium-hub.conf /etc/init/
  start selenium-hub
fi

exit