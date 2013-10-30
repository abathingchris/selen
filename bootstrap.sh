#!/usr/bin/env bash

apt-get update

apt-get install -y curl openjdk-7-jdk

mkdir -p /opt/selenium
pushd /opt/selenium/
curl -O https://selenium.googlecode.com/files/selenium-server-standalone-2.37.0.jar

exit