#!/usr/bin/env bash
echo ""
echo ""
echo "## -> Installing Apache"
sudo apt-get install apache2 -y

# enable mpm_prefork
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork

# restart apache
echo ""
echo ""
echo "## -> Restarting Apache"
sudo service apache2 restart

# setup virtual hosts
echo ""
echo ""
echo "## -> Enabling Virtual hosts"
sudo a2enmod vhost_alias

# create vhosts file
sudo cp /home/ubuntu/source-files/apache-dynamic-vhosts.conf /etc/apache2/sites-available/dynamic-vhosts.conf

# enable vhosts site config
sudo a2ensite dynamic-vhosts

echo ""
echo ""
echo "## -> Enabling Rewrite module"
# enable rewrite module
sudo a2enmod rewrite

echo ""
echo ""
echo "## -> Enabling Headers module"
# enable headers module
sudo a2enmod headers

echo ""
echo ""
echo "## -> Changing document root to /home/ubuntu/www"
sudo rm -rf /var/www/html
sudo ln -s /home/ubuntu/www /var/www/html

echo ""
echo ""
echo "## -> Setting Apache user and group"
sudo sed -ie 's/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=ubuntu/g' /etc/apache2/envvars
sudo sed -ie 's/export APACHE_RUN_GROUP=ubuntu/export APACHE_RUN_GROUP=ubuntu/g' /etc/apache2/envvars

# restart apache
echo ""
echo ""
echo "## -> Restarting Apache"
sudo service apache2 restart