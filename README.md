# FastAPI Deployment Flowchart


This is a work in progress. DO NOT USE THIS IN REAL PRODUCTION. 

This is meant to get up and running asap on a cheap box. 



1. Start
2. Update and Install Packages
   - Python3
   - pip
   - Nginx
   - UFW
3. Setup Virtual Environment
4. Install FastAPI and Uvicorn
5. Create FastAPI Application
   - Create main.py
   - Define Routes
6. Configure Systemd Service
   - Create Service File
   - Enable Service
   - Start Service
7. Configure Nginx
   - Create Nginx Config
   - Enable Site
   - Restart Nginx
8. Setup UFW Firewall
   - Allow SSH
   - Allow HTTP
   - Enable UFW
9. Display IP and Log Instructions
