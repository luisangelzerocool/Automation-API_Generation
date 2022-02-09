#!/bin/bash
# Usage: connect-to-machine.sh
# Author: Luis Angel Vanegas
# Version: 1.0

echo "connecting to Darkness machine in AWS Lightsail" 
sudo ssh <user_machine>@<ip_machine> -i private-key.pem