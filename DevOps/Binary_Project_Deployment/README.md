# Weather App Deployment Script

This project automates the deployment of a Flask-based weather application using **Nginx**, **Gunicorn**, and a **Python virtual environment**.

## Features
- **Automated setup** for Flask, Gunicorn, and Nginx.
- **Reverse proxy** configuration for secure traffic handling.
- Configurable **rate limiting** and **connection restrictions**.
- Integrated **systemd service** for managing the Flask application.

## Prerequisites
- Ubuntu-based server.
- Root privileges.

## Deployment Steps
1. Clone or download this repository to your server.
2. Edit the `auto_deployment.sh` script:
   - Update the global variables:
     - `WorkingDirectory` – Path to the application folder.
     - `AppName` – Name of the main Python module (e.g., `app.py`).
     - `ServiceName` – Name of the systemd service.
     - `ServerName` – Public IP address or domain name.
     - `ServerPort` – Port number for Nginx.
3. Run the deployment script -
   ```bash
   sudo chmod +x auto_deployment.sh
   ./auto_deployment.sh
