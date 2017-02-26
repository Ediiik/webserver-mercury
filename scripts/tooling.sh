#!/usr/bin/env bash

# git
echo ""
echo ""
echo "## -> Installing git"
sudo apt-get install git

# vim
echo ""
echo ""
echo "## -> Installing VIM"
sudo apt-get install vim

# composer
echo ""
echo ""
echo "## -> Installing Composer"
EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
rm composer-setup.php
sudo mv composer.phar /usr/local/bin/composer

# nodejs
echo ""
echo ""
echo "## -> Installing NodeJS"
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs

# supervisor
echo ""
echo ""
echo "## -> Installing Supervisor"
sudo apt-get -y install supervisor