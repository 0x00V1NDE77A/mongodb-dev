#!/bin/bash

# Add MongoDB GPG key
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

# Create a list file for MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

# Update the package list
sudo apt update

# Install MongoDB
sudo apt install -y mongodb-org

# Configure MongoDB to bind to IP 0.0.0.0
sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/g' /etc/mongod.conf

# Restart MongoDB service
sudo systemctl restart mongod

# Enable MongoDB service to start at boot time
sudo systemctl enable mongod

echo "MongoDB installed and bound to IP 0.0.0.0"
