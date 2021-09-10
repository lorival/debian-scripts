#!/bin/bash

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
./install-docker.sh
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

echo "----------------------"
echo "Done! enjoy it... >:-)"
echo "----------------------"
echo
