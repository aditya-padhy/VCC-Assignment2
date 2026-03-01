#!/bin/bash

gcloud compute instance-groups managed create assignment2 \
    --base-instance-name=instance1 \
    --template=assignment2-template \
    --size=1 \
    --zone=asia-south2-a