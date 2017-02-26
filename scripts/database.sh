#!/usr/bin/env bash

# Install MySQL Server
echo ""
echo ""
echo "## -> Installing MySQL Server"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password secret'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password secret'
sudo apt-get install -qq mysql-server mysql-client

# allow connection from anywhere
echo ""
echo ""
echo "## -> Allowing MySQL remote connections"
sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# create mercury user and grant privileges
echo ""
echo ""
echo "## -> Creating user and granting privileges"
mysql -uroot -psecret -e "GRANT ALL ON *.* TO 'mercury'@'%' IDENTIFIED BY 'secret' WITH GRANT OPTION;FLUSH PRIVILEGES;"

echo ""
echo ""
echo "## -> Restarting MySQL"
sudo service mysql restart
