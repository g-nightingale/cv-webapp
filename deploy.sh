#!/bin/bash

# --- Configuration ---
PROJECT="gn-projects-490621"
CONTAINER="gn-cv"
APP_NAME="gn-cv"
# ---------------------

# Stop script if any command fails
set -e

echo "Setting GCP project..."
gcloud config set project "$PROJECT"

echo "Building and pushing container..."
gcloud builds submit . --tag "gcr.io/$PROJECT/$CONTAINER"

echo "Deploying to Cloud Run..."
gcloud run deploy "$APP_NAME" \
  --image "gcr.io/$PROJECT/$CONTAINER" \
  --memory 512Mi \
  --cpu 1 \
  --platform managed \
  --region "europe-west1" \
  --allow-unauthenticated \
  --max-instances=1

echo "Deployment complete."