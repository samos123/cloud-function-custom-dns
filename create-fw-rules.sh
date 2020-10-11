#!/usr/bin/env bash

set -x

gcloud compute firewall-rules create "cloud-dns-udp-53-internal" --allow=udp:53 \
            --source-ranges="35.199.192.0/19" --description="Needed for cloud dns private forwarding"
