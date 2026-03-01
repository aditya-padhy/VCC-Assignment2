#!/bin/bash

gcloud compute instance-templates create assignment2-template \
    --machine-type=e2-micro \
    --image-family=debian-12 \
    --image-project=debian-cloud \
    --boot-disk-type=pd-balanced \
    --metadata-from-file startup-script=startup_script.sh \
    --tags=http-server