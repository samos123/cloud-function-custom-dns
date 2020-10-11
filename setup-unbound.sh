#!/usr/bin/env bash

apt-get update
apt-get install -y unbound jq dnsutils
current_ip=$(ip --json a show dev ens4 | jq '.[0].addr_info[0].local' -r)
cat > /etc/unbound/unbound.conf << EOF
include: "/etc/unbound/unbound.conf.d/*.conf"

server:
    interface: $current_ip
    access-control: 35.199.192.0/19 allow
    access-control: 10.0.0.0/8 allow
    access-control: ::1 allow
    verbosity: 1
    local-zone: "samos-it.com." transparent
    local-data: "samos-it.com. 5 IN A $current_ip"
    cache-max-ttl: 5
    infra-host-ttl: 5
EOF

systemctl restart unbound
