#!/bin/bash

gcloud projects add-iam-policy-binding auto-scaling \
    --member="user:b22cs004@iitj.ac.in" \
    --role="roles/viewer"