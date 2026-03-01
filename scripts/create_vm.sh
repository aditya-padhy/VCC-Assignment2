#!/bin/bash

gcloud compute instances create instance1 \
    --zone=asia-south2-a \
    --machine-type=e2-micro \
    --image-family=debian-12 \
    --image-project=debian-cloud \
    --boot-disk-type=pd-balanced \
    --tags=http-server \
    --metadata-from-file startup-script=startup_script.sh