FLOW

This is work in progress and just meant to get running fast as possibel on a cheap box. 

Start
  │
  ↓
Update and Install Packages
  │  ├─ Python3
  │  ├─ pip
  │  ├─ Nginx
  │  └─ UFW
  │
  ↓
Setup Virtual Environment
  │
  ↓
Install FastAPI and Uvicorn
  │
  ↓
Create FastAPI Application
  │  ├─ Create main.py
  │  └─ Define Routes
  │
  ↓
Configure Systemd Service
  │  ├─ Create Service File
  │  ├─ Enable Service
  │  └─ Start Service
  │
  ↓
Configure Nginx
  │  ├─ Create Nginx Config
  │  ├─ Enable Site
  │  └─ Restart Nginx
  │
  ↓
Setup UFW Firewall
  │  ├─ Allow SSH
  │  ├─ Allow HTTP
  │  └─ Enable UFW
  │
  ↓
Display IP and Log Instructions
  │
  ↓
End
