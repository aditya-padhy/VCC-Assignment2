#!/bin/bash

sudo apt install -y apache2
sudo systemctl start apache2

echo "<html><body><h1>Auto-scaling Test</h1></body></html>" | sudo tee /var/www/html/index.html