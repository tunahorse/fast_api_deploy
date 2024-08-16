


This is a work in progress. DO NOT USE THIS IN REAL PRODUCTION. 

This is meant to get up and running asap on a cheap box. 


# FastAPI Deployment Script Documentation

## Overview

This script automates the deployment of a FastAPI application on a Ubuntu server. It sets up the environment, installs necessary packages, configures Nginx as a reverse proxy, and creates a systemd service to manage the application.

## Prerequisites

- Ubuntu server (tested on Ubuntu 20.04 LTS)
- Sudo access

## Steps

1. **Update and Install Packages**: 
   - Updates the package list
   - Installs Python3, pip, Nginx, and UFW

2. **Setup Virtual Environment**:
   - Creates a Python virtual environment
   - Installs FastAPI and Uvicorn

3. **Create FastAPI Application**:
   - Generates a simple FastAPI application with two endpoints

4. **Configure Systemd Service**:
   - Creates a systemd service file for the FastAPI application
   - Enables and starts the service

5. **Configure Nginx**:
   - Sets up Nginx as a reverse proxy
   - Enables gzip compression

6. **Configure Firewall**:
   - Sets up UFW to allow SSH and HTTP traffic

## How to Run the Deployment Script

clone the repo 

1.
   Run the following command in the terminal:
   ```
   chmod +x deploy_fastapi.sh
   ```

3. **Run the script**:
   Execute the script with sudo privileges:
   ```
   sudo ./deploy_fastapi.sh
   ```

3. **Check the output**:
   - The script will display the server's IP address where the application is accessible
   - It will also provide instructions on how to check the application logs
   - The nuke script removes the fastapi install 

## Post-Deployment

- Access your FastAPI application by navigating to `http://your_server_ip`
- You can check the application logs using: `sudo journalctl -u myfastapiapp -f`

## Troubleshooting

If you encounter any issues:
1. Check the systemd service status: `sudo systemctl status myfastapiapp`
2. Review the Nginx configuration: `sudo nginx -t`
3. Ensure the firewall is configured correctly: `sudo ufw status`

## Customization

- Modify the `main.py` file to change the FastAPI application
- Adjust the Nginx configuration in the script for custom domain setup
- Modify the systemd service file to change resource limits or other parameters
