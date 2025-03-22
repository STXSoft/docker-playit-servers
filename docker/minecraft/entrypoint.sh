#!/bin/bash

if [ -f /opt/stxsoft/config/server.properties ]; then
	echo "🔧 Copying custom server.properties"
	cp /opt/stxsoft/config/server.properties /data/server.properties
	chown 1000:1000 /data/server.properties
	chmod 644 /data/server.properties
fi

exec /start
