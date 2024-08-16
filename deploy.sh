#!/bin/bash

# Set the application directory to the current directory
APP_DIR=$(pwd)

# Update and install necessary packages
sudo apt update && sudo apt install -y python3 python3-venv python3-pip nginx ufw

# Setup the virtual environment
python3 -m venv venv

# Activate the virtual environment and install packages
./venv/bin/pip install fastapi "uvicorn[standard]"

# Create a simple FastAPI application
cat << EOF > main.py
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/items/{item_id}")
async def read_item(item_id: int):
    return {"item_id": item_id}
EOF

# Remove the default nginx configuration (if it exists)
sudo rm -f /etc/nginx/sites-enabled/default

# Create Uvicorn systemd service file
cat << EOF | sudo tee /etc/systemd/system/myfastapiapp.service
[Unit]
Description=Uvicorn instance to serve FastAPI app
After=network.target

[Service]
WorkingDirectory=$APP_DIR
ExecStart=$APP_DIR/venv/bin/uvicorn main:app --workers 2 --host 0.0.0.0 --port 8000
Restart=on-failure
RestartSec=5s
CPUQuota=80%
MemoryMax=512M

[Install]
WantedBy=multi-user.target
EOF

# Restart and enable the Uvicorn service
sudo systemctl daemon-reload
sudo systemctl restart myfastapiapp
sudo systemctl enable myfastapiapp

# Setup Nginx configuration
cat << EOF | sudo tee /etc/nginx/sites-available/myfastapiapp
server {
    listen 80;
    server_name _;
    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
    # Enable gzip compression
    gzip on;
    gzip_vary on;
    gzip_min_length 10240;
    gzip_proxied expired no-cache no-store private auth;
    gzip_types text/plain text/css text/xml text/javascript application/x-javascript application/xml;
    gzip_disable "MSIE [1-6]\.";
}
EOF

# Enable the site and restart Nginx
sudo ln -sf /etc/nginx/sites-available/myfastapiapp /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx

# Configure UFW (Uncomplicated Firewall)
sudo ufw allow 22
sudo ufw allow 80
sudo ufw --force enable

echo "Simple FastAPI Deployment completed successfully!"

# Display the IP address for easy access
echo "You can now access your FastAPI application at: http://$(curl -s ifconfig.me)"

# Provide instructions for checking logs
echo "To check the application logs, run: sudo journalctl -u myfastapiapp -f"
