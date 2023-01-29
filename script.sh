#!/bin/bash

# Install nginx, node, and git
sudo yum install -y nginx nodejs git

# Clone the nodejs-simple-http repo
git clone https://github.com/dhemoz/server-node.git

# Move into the repo directory
cd server-node

# Start the nodejs app
sudo node server-node.js &

# Configure nginx as a reverse proxy
sudo cat > /etc/nginx/conf/nginx.conf <<EOF
server {
  listen       80;
  server_name  localhost;
  location / {
    proxy_pass http://localhost:3000;
  }
}
EOF

# Add Firewall
sudo yum install firewalld -y
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --add-service=http
sudo firewall-cmd --add-service=https
sudo firewall-cmd --runtime-to-permanent
sudo firewall-cmd --reload

# Add IPTables
sudo yum install iptables-services -y
sudo systemctl start iptables
sudo systemctl start ip6tables
sudo systemctl enable iptables
sudo systemctl enable ip6tables
sudo iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT -p tcp -m tcp --dport 443 -j ACCEPT
sudo systemctl restart iptables
sudo systemctl restart ip6tables

# Set SELinux
sudo setsebool -P httpd_can_network_connect 1

#Install SSL
sudo yum install epel-release -y
sudo yum install certbot-nginx -y

# Restart nginx
sudo systemctl restart nginx