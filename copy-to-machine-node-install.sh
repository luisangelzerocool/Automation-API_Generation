#!/bin/bash
# Usage: copy-to-machine-node-install.sh
# Author: Luis Angel Vanegas
# Version: 1.0

sudo scp -i ./private-key.pem ./node-install.sh <user_machine>@<ip_machine>:./