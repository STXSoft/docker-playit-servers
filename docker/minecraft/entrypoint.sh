#!/bin/bash
set -e
if [ ! -f "/data/CONFIGURED" ]; then
    echo "First run detected, initializing server configuration..."
    touch /data/CONFIGURED
    if [ -f "/server.properties" ]; then
        echo "Applying custom configuration from /server.properties"
        cp /server.properties /data/server.properties
        chown 1000:1000 /data/server.properties
        chmod 644 /data/server.properties
    else
        echo "No custom configuration provided, using default settings."
    fi
else
    echo "Server already configured, skipping initialization."
fi

exec /start
