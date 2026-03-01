#!/bin/bash

# Update system
apt update

# Install Apache
apt install -y apache2

# Start Apache
systemctl start apache2

# Enable Apache on boot
systemctl enable apache2

# Create simple test page
echo "<html><body><h1>Auto-scaling Test - VCC Assignment 2</h1></body></html>" > /var/www/html/index.html