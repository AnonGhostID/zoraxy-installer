#!/bin/bash

mkdir -p /root/zoraxy

# Get latest release tag from GitHub API
LATEST_TAG=$(curl -s https://api.github.com/repos/tobychui/zoraxy/releases | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/')
# download zoraxy
wget "https://github.com/tobychui/zoraxy/releases/download/${LATEST_TAG}/zoraxy_linux_amd64" -O /root/zoraxy/zoraxy

# Make it executable
chmod +x /root/zoraxy/zoraxy

# Create startproxy.sh
cat <<EOF > /root/zoraxy/startproxy.sh
#!/bin/bash
./zoraxy -port=:8000
EOF
chmod +x /root/zoraxy/startproxy.sh

# Create systemd service file
cat <<EOF > /etc/systemd/system/zoraxy.service
[Unit]
Description=Zoraxy Reverse Proxy Server
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=root
Group=root
WorkingDirectory=/root/zoraxy
ExecStart=/root/zoraxy/startproxy.sh
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=zoraxy

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd to recognize the new service
systemctl daemon-reload
# Enable the service to start on boot
systemctl enable zoraxy
# Start the service
systemctl start zoraxy
# Check the status of the service
systemctl status zoraxy