#!/usr/bin/env bash

# update the packages
echo ""
echo ""
echo "## -> Updating packages"
sudo apt-get update

# upgrade the packages
echo ""
echo ""
echo "## -> Upgrading packages"
sudo apt-get upgrade -y

echo "## -> Set correct timezone"
echo ""
echo ""
sudo rm /etc/localtime
sudo ln -s /usr/share/zoneinfo/Europe/Bratislava /etc/localtime
