#!/bin/bash

echo "nginx..."
cd /tmp

echo "    Dependencies"
# Install the prerequisites:
sudo apt -qq install -y curl gnupg2 ca-certificates lsb-release > /tmp/bin/install.log 2>&1

echo "    Add repository"
# To set up the apt repository for stable nginx packages, run the following command:
sudo echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" > /etc/apt/sources.list.d/nginx.list

echo "    Add key"
# Next, import an official nginx signing key so apt could verify the packages authenticity:
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add - > /tmp/bin/install.log 2>&1

echo "    Validate key"
# Verify that you now have the proper key:
sudo apt-key fingerprint ABF5BD827BD9BF62 > /tmp/bin/install.log 2>&1

# To install nginx, run the following commands:
echo "    Updating"
sudo apt -qq update > /tmp/bin/install.log 2>&1

echo "    Installing"
sudo apt -qq install -y nginx > /tmp/bin/install.log 2>&1

echo "    Done"
