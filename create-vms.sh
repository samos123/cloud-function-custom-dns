#!/usr/bin/env bash
set -x

MACHINE_TYPE=e2-micro
gcloud compute instances create dns-1 \
          --image-family=ubuntu-2004-lts --image-project=ubuntu-os-cloud \
          --zone=us-central1-a \
          --boot-disk-size 50G \
          --boot-disk-type pd-ssd \
          --can-ip-forward \
          --network default \
          --metadata-from-file="startup-script=setup-unbound.sh" \
          --machine-type $MACHINE_TYPE

gcloud compute instances create dns-2 \
          --image-family=ubuntu-2004-lts --image-project=ubuntu-os-cloud \
          --zone=us-central1-f \
          --boot-disk-size 50G \
          --boot-disk-type pd-ssd \
          --can-ip-forward \
          --network default \
          --metadata-from-file="startup-script=setup-unbound.sh" \
          --machine-type $MACHINE_TYPE

source create-fw-rules.sh
