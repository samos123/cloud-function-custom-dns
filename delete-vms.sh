#!/usr/bin/env bash
gcloud compute instances delete -q dns-1 --zone us-central1-a
gcloud compute instances delete -q dns-2 --zone us-central1-f
