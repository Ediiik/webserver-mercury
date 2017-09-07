#!/usr/bin/env bash

# add php71 personal repository
echo ""
echo ""
echo "## -> Adding personal repository ppa:ondrej/php"
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update

# install php with base packages
echo ""
echo ""
echo "## -> Installing PHP 7.1"
sudo apt-get -y install php7.1 php7.1-mysql

# aditional packages
echo ""
echo ""
echo "## -> Installing additional PHP packages"
sudo apt-get -y install php7.1-curl
sudo apt-get -y install php7.1-json
sudo apt-get -y install php7.1-cgi
sudo apt-get -y install php7.1-zip
sudo apt-get -y install php-gd
sudo apt-get -y install imagick
sudo apt-get -y install php-imagick
sudo apt-get -y install php7.1-intl
sudo apt-get -y install php7.1-mbstring

# enable mysqlnd module
sudo phpenmod mysqlnd

# enable pdo module
sudo phpenmod pdo

# restart apache
echo ""
echo ""
echo "## -> Restarting Apache"
sudo systemctl restart apache2
