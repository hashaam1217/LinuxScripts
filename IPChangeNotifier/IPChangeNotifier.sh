#!/bin/bash

current_ip=$(curl ifconfig.me)
website_ip="128.189.177.146"
if [ "$current_ip" != "$website_ip" ]; then
    curl -d "ROUTER IP HAS CHANGED, WEBSITE DOWN" ntfy.sh/Hashaam_ip_change
fi
exit 0
