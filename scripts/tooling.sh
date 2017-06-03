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

# PDF generators (snappy)
echo ""
echo ""
echo "## -> Installing support tools for PDF generators"
sudo apt-get install libgtk2.0-0 libgdk-pixbuf2.0-0 libfontconfig1 libxrender1 libx11-6 libglib2.0-0  libxft2 libfreetype6 libc6 zlib1g libpng12-0 libstdc++6-4.8-dbg-arm64-cross libgcc1 

# supervisor
echo ""
echo ""
echo "## -> Installing Supervisor"
sudo apt-get -y install supervisor