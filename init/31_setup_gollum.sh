#!/bin/bash

mkdir -p /data /config

[[ ! -f /config/config.rb ]] && cp /defaults/config.rb /config/config.rb

chown abc:abc /config/config.rb /data

if [ ! -d /data/.git ]; then
    git init /data
fi
