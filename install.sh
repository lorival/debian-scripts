#!/bin/bash

echo "--------------------"
echo "Removing packages..."
echo "--------------------"
echo

for entry in package-lists/to-remove/* 
do
    echo "--> $entry" 
    echo 
    cat $entry | xargs sudo apt-get -y remove
    echo
done

echo "-----------------------------------"
echo "Installing requirements packages..."
echo "-----------------------------------"
echo 

for entry in package-lists/to-install/requirements/* 
do
    echo "--> $entry" 
    echo 
    cat $entry | xargs sudo apt-get -y install
    echo
done

echo "-----------------------------------"
echo "Addind GPG keys and repositories..."
echo "-----------------------------------"
echo 
./add-gpg-key.sh
./add-repositories.sh
echo

echo "--------------------"
echo "Updating packages..."
echo "--------------------"
echo 
sudo apt-get update
echo

echo "----------------------"
echo "Installing packages..."
echo "----------------------"
echo 

for entry in package-lists/to-install/* 
do
    echo "--> $entry" 
    echo 
    cat $entry | xargs sudo apt-get -y install
    echo
done

echo "---------------------------"
echo "Removing unused packages..."
echo "---------------------------"
echo 
sudo apt-get autoremove
sudo apt-get clean
echo

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
