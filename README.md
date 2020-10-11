# Testing Cloud DNS failover with Cloud Function
This repo contains scripts and code to validate Cloud Functions can talk to
DNS servers running on the VPC as VMs.


## Setup

Deploy the cloud function that shows the a record of samos-it.com:
```
gcloud functions deploy dnstest --source=. --runtime nodejs10 --trigger-http --allow-unauthenticated
```

Create VMs dns-1 and dns-2 that reside in us-central1-a and us-central1-f:
```
./create-vms.sh
```

Configure cloud DNS to forward DNS queries for samos-it.com to the DNS proxies:
```
./create-private-dns-zone.sh
```

Configure serverless VPC connector through the UI

## cleanup
```
./delete-vms.sh
./delete-private-dns-zone.sh
```
