graph TD
    A[Start] --> B[Update and Install Packages]
    B --> C[Setup Virtual Environment]
    C --> D[Install FastAPI and Uvicorn]
    D --> E[Create FastAPI Application]
    E --> F[Configure Systemd Service]
    F --> G[Configure Nginx]
    G --> H[Setup UFW Firewall]
    H --> I[Display IP and Log Instructions]
    I --> J[End]

    B --> B1[Python3]
    B --> B2[pip]
    B --> B3[Nginx]
    B --> B4[UFW]

    E --> E1[Create main.py]
    E --> E2[Define Routes]

    F --> F1[Create Service File]
    F --> F2[Enable Service]
    F --> F3[Start Service]

    G --> G1[Create Nginx Config]
    G --> G2[Enable Site]
    G --> G3[Restart Nginx]

    H --> H1[Allow SSH]
    H --> H2[Allow HTTP]
    H --> H3[Enable UFW]
