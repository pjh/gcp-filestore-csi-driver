#!/bin/bash

set -x
set -o nounset
set -o errexit

mydir=$(dirname $0)
source "$mydir/common.sh"

# Cleanup old service account and key
if [ -f $GCFS_SA_FILE ]; then
  rm "$GCFS_SA_FILE"
fi
gcloud projects remove-iam-policy-binding "$PROJECT" --member serviceAccount:"$GCFS_IAM_NAME" --role roles/file.editor || true
gcloud iam service-accounts delete "$GCFS_IAM_NAME" --quiet || true

# Create new service account and key
gcloud iam service-accounts create "$GCFS_SA_NAME"
gcloud iam service-accounts keys create "$GCFS_SA_FILE" --iam-account "$GCFS_IAM_NAME"
gcloud projects add-iam-policy-binding "$PROJECT" --member serviceAccount:"$GCFS_IAM_NAME" --role roles/file.editor
