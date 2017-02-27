#!/usr/bin/env bash

# install php with base packages
echo ""
echo ""
echo "## -> Installing PHP7"
sudo apt-get -y install php7.0 php-pear libapache2-mod-php7.0 php7.0-mysql

# aditional packages
echo ""
echo ""
echo "## -> Installing additional PHP packages"
sudo apt-get -y install php7.0-curl php7.0-json php7.0-cgi php7.0-zip

# enable mysqlnd module
sudo phpenmod mysqlnd

# enable pdo module
sudo phpenmod pdo

# restart apache
echo ""
echo ""
echo "## -> Restarting Apache"
sudo systemctl restart apache2