#!/bin/bash

echo "-----------------------"
echo "Configuring keyboard..."
echo "-----------------------"
echo
export PATH=$PATH:/usr/sbin
sudo dpkg-reconfigure keyboard-configuration
echo

echo "----------------------"
echo "Done! enjoy it... >:-)"
echo "----------------------"
echo
