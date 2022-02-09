#!/bin/bash
# Usage: node-install.sh
# Author: Luis Angel Vanegas
# Version: 1.0

echo "installing node in AWS Lightsail" 
sudo apt update -y
sudo apt install nodejs -y
sudo apt install npm -y
node -v