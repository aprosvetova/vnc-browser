#!/bin/sh

# If VNC_PASSWORD is not set, use a default password
VNC_PASSWORD=${VNC_PASSWORD:-password}
echo "Current vnc password is: $VNC_PASSWORD"

# If VNC_RESOLUTION is not set, use a default resolution
VNC_RESOLUTION=${VNC_RESOLUTION:-1280x1024}
echo "Current VNC resolution is: $VNC_RESOLUTION"

# If STARTING_WEBSITE_URL is not set, use a default website
STARTING_WEBSITE_URL=${STARTING_WEBSITE_URL:-https://www.google.com}
echo "Current starting website is: $STARTING_WEBSITE_URL"

# Start Supervisor
exec supervisord -c /etc/supervisord.conf