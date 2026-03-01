#!/bin/bash

gcloud compute instance-groups managed set-autoscaling assignment2 \
    --zone=asia-south2-a \
    --min-num-replicas=1 \
    --max-num-replicas=5 \
    --target-cpu-utilization=0.6 \
    --cool-down-period=60