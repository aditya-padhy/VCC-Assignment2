#!/bin/bash

# Create health check
gcloud compute health-checks create http health-check-2 \
    --port 80

# Create backend service
gcloud compute backend-services create vcc-assignment-2-backend \
    --protocol=HTTP \
    --health-checks=health-check-2 \
    --global

# Add instance group to backend
gcloud compute backend-services add-backend vcc-assignment-2-backend \
    --instance-group=assignment2 \
    --instance-group-zone=asia-south2-a \
    --global

# Create URL map
gcloud compute url-maps create vcc-assignment-2-map \
    --default-service=vcc-assignment-2-backend

# Create HTTP proxy
gcloud compute target-http-proxies create vcc-assignment-2-proxy \
    --url-map=vcc-assignment-2-map

# Create forwarding rule
gcloud compute forwarding-rules create vcc-assignment-2-forwarding-rule \
    --global \
    --target-http-proxy=vcc-assignment-2-proxy \
    --ports=80