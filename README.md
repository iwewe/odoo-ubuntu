# Odoo 17 Installation Script for Ubuntu Server 23.10

This script automates the installation process of Odoo 17 version , a powerful and customizable open-source business management platform, on Ubuntu server 23.10. Whether you're setting up Odoo for development, testing, or production, this script streamlines the installation steps, saving you time and ensuring a consistent setup.

## Features:

- **Dependency Installation:** Automatically installs the necessary dependencies for Odoo, including Python libraries and system packages.
- **PostgreSQL Configuration:** Sets up and configures PostgreSQL, the database management system used by Odoo.
- **Node.js and Less:** Installs Node.js and Less for handling asset compilation and management.
- **System User and Group:** Creates a dedicated system user and group for running Odoo securely.
- **GitHub Clone:** Clones the Odoo repository from GitHub, allowing you to install the latest version.
- **Configuration File Setup:** Creates and customizes the Odoo configuration file with default settings.
- **System Service:** Configures Odoo as a system service for easy management and startup.
- **Firewall Configuration:** Optionally opens the necessary ports in the firewall to allow external access.

## Usage:

1. Clone this repository to your Ubuntu server.
2. Adjust configuration settings in the script if needed, by default the DB password is **HeyJude453!**.
3. Make the script executable (`chmod +x install_odoo.sh`).
4. Run the script (`./install_odoo.sh`) and follow the prompts.

This script simplifies the Odoo installation process, making it accessible for users with varying levels of experience. Enjoy the power of Odoo on your Ubuntu server effortlessly!
