#!/bin/sh

if [ ! -f /app/config.toml ]; then
    echo "Error: config.toml not found. Please mount a configuration file to /app/config.toml"
    exit 1
fi

exec moq-relay config.toml
