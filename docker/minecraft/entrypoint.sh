#!/bin/bash
if [ -n "${CUSTOM_CONFIG}" ]; then
    echo "CUSTOM_CONFIG is set"
    if [ -f "/opt/stxsoft/config/${CUSTOM_CONFIG}" ]; then
        echo "🔧 Copying custom server config to '/data/server.properties'"
    	cp "/opt/stxsoft/config/${CUSTOM_CONFIG}" /data/server.properties
	    chown 1000:1000 /data/server.properties
    	chmod 644 /data/server.properties
    fi
else
    echo "CUSTOM_CONFIG is not set, server will use default configuration!"
fi

exec /start
