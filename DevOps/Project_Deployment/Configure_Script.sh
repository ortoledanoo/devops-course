#!/bin/bash

# Do  chmod 775

echo "This Script Will install and Configure Flask, Gunicorn, Nginx, and the Python Virtual Environment."


#____________________________________#
# Change This Section before running #
#____________________________________#

# Project Directory Path
WorkingDirectory="/home/server_2/weather_app"

# Name Of Main .py Module
AppName="app"

# Service Name
ServiceName="weather_app"

# Server IP address
ServerName="10.1.0.177"

# Port for Nginx to Listen On
ServerPort="9090"

# IP Address To Bind Gunicorn
ServerIP="0.0.0.0" 


# Script starts here #
#____________________#

# Update libraries
sudo apt-get update
sudo apt-get -y upgrade

# Install Python and Necessary Packages
sudo apt-get -y install python3 python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools
sudo apt -y autoremove # Removes unneeded files

# Install The Python Virtual Environment
sudo apt-get -y install python3-venv

# Install Nginx Web Server
sudo apt-get -y install nginx

# Start and Enable the nginx service
sudo systemctl start nginx
sudo systemctl enable nginx

# Create The App Directory if it Doesn't Exist
if [ ! -d "$WorkingDirectory" ]; then
    mkdir -p $WorkingDirectory
fi

# Navigate to the App Directory
cd $WorkingDirectory

# Install the Python Virtual Environment
python3 -m venv venv

# Activate the Virtual Environment
source venv/bin/activate

# Install requirements.txt if it Exists
if [ -f requirements.txt ]; then
    pip install -r requirements.txt
else
    echo "No requirements.txt found, skipping installation."
fi

# Install Gunicorn and Flask
pip install wheel
pip install gunicorn flask

# Create WSGI link to Gunicorn
cat << EOF > wsgi.py
from $AppName import app
if __name__ == '__main__':
    app.run()
EOF

# Create Log Directory for Gunicorn
sudo mkdir -p /var/log/gunicorn/ # use -p to avoid errors

# Create Systemd Service for Flask
sudo bash -c "cat << EOF > /etc/systemd/system/$ServiceName.service
[Unit]
Description=Gunicorn instance to serve Flask
After=network.target

[Service]
User=root
Group=www-data
WorkingDirectory=$WorkingDirectory
Environment=\"PATH=$WorkingDirectory/venv/bin\"
ExecStart=$WorkingDirectory/venv/bin/gunicorn --bind $ServerIP:5000 wsgi:app --error-logfile /var/log/gunicorn/access.log --capture-output --log-level info

[Install]
WantedBy=multi-user.target
EOF"

# Remove Default Site from Nginx
sudo rm -f /etc/nginx/sites-enabled/default

# Reload systemd daemon
sudo systemctl daemon-reload

# Start the Flask service and enable it on reboot
sudo systemctl start $ServiceName
sudo systemctl enable $ServiceName

# Create Nginx Reverse Proxy for Flask
sudo bash -c "cat << EOF > /etc/nginx/sites-available/$ServiceName
server {
    listen $ServerPort;
    server_name $ServerName;

    location / {
        include proxy_params;
        proxy_pass http://$ServerIP:5000;
    }
}
EOF"

sudo ln -s /etc/nginx/sites-available/$ServiceName /etc/nginx/sites-enabled

# Check Nginx Configuration File
sudo nginx -t

# Restart Gunicorn and Nginx
sudo systemctl restart $ServiceName
sudo systemctl restart nginx

echo ""
echo "Install Complete!"
echo "Test Flask App in Browser at http://$ServerName"
echo "Logs --> /var/log/gunicorn/"


