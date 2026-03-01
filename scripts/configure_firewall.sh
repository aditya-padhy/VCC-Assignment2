#!/bin/bash

gcloud compute firewall-rules create user-def-firewall-rule \
    --network=default \
    --priority=10 \
    --direction=INGRESS \
    --action=ALLOW \
    --rules=tcp:80 \
    --source-ranges=0.0.0.0/0