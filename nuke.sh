#!/bin/bash

# Stop and disable the FastAPI service
sudo systemctl stop myfastapiapp
sudo systemctl disable myfastapiapp

# Remove the service file
sudo rm /etc/systemd/system/myfastapiapp.service

# Remove the Nginx configuration
sudo rm /etc/nginx/sites-available/myfastapiapp
sudo rm /etc/nginx/sites-enabled/myfastapiapp

# Reload systemd and restart Nginx
sudo systemctl daemon-reload
sudo systemctl restart nginx

# Remove the FastAPI user
sudo userdel -r fastapi_user

# Remove the application directory
sudo rm -rf /home/ubuntu/fastapi_deploy_script

# Remove the virtual environment
sudo rm -rf /home/ubuntu/fastapi_deploy_script/venv

# Optionally, remove Python and Nginx if you no longer need them
# Uncomment these lines if you want to remove these packages
# sudo apt remove -y python3 python3-venv python3-pip nginx
# sudo apt autoremove -y

echo "FastAPI deployment has been nuked successfully!"
