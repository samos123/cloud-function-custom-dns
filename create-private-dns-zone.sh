#!/usr/bin/env bash

set -x

DNS1_IP=$(gcloud compute instances describe dns-1 --format='get(networkInterfaces[0].networkIP)' --zone us-central1-a)
DNS2_IP=$(gcloud compute instances describe dns-2 --format='get(networkInterfaces[0].networkIP)' --zone us-central1-f)

gcloud dns managed-zones create samos-it \
    --networks=default \
    --private-forwarding-targets=$DNS1_IP,$DNS2_IP \
    --dns-name samos-it.com --description samos-it.com \
    --visibility=private
