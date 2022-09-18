#!/bin/bash
set -e

# set-up Tailscale
/app/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
/app/tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=fly-app --ssh

# start litestream and the app
/scripts/run.sh
