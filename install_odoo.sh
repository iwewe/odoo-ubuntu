#!/bin/bash

# Update the system
sudo apt-get update
sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install -y python3-pip python3-dev libxml2-dev libxslt1-dev zlib1g-dev libsasl2-dev libldap2-dev build-essential libssl-dev libffi-dev libmysqlclient-dev libjpeg-dev libpq-dev libjpeg8-dev liblcms2-dev libblas-dev libatlas-base-dev

# Install additional dependencies for Odoo
sudo apt-get install -y npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g less less-plugin-clean-css -y
sudo ln -s /usr/bin/lessc /usr/bin/less

# Create system user and group
sudo adduser --system --home=/opt/odoo --group odoo

# Install and configure PostgreSQL
sudo apt-get install -y postgresql
sudo su - postgres -c "createuser --createdb --username postgres --no-createrole --no-superuser --pwprompt odoo"

# Clone Odoo from GitHub (adjust the branch or repository as needed)
sudo git clone --depth=1 --branch=17.0 --single-branch https://www.github.com/odoo/odoo /opt/odoo/odoo

# Install Odoo dependencies
sudo pip3 install -r /opt/odoo/odoo/requirements.txt

# Create Odoo configuration file
sudo cp /opt/odoo/odoo/debian/odoo.conf /etc/odoo.conf
sudo chown odoo: /etc/odoo.conf
sudo chmod 640 /etc/odoo.conf

# Customize Odoo configuration file
sudo sed -i 's/db_host = False/db_host = localhost/' /etc/odoo.conf
sudo sed -i 's/db_user = False/db_user = odoo/' /etc/odoo.conf
sudo sed -i 's/db_password = False/db_password = HeyJude453!/' /etc/odoo.conf

# Create Odoo service
sudo cp /opt/odoo/odoo/debian/init /etc/init.d/odoo
sudo chmod +x /etc/init.d/odoo
sudo update-rc.d odoo defaults

# Start Odoo service
sudo service odoo start

# Open firewall ports if necessary (adjust according to your setup)
sudo ufw allow 8069

# Display Odoo log file location
echo "Odoo log file is located at: /var/log/odoo/odoo.log"
