#!/bin/bash

set -euo pipefail

PROXY_PORT="34343"

# Check if Minikube is running
if ! minikube status &>/dev/null; then
  # Start the minikube
  echo "Minikube is not running. Starting Minikube..."
  minikube start
else
  echo "Minikube is already running"
fi

# Configure the kubectl proxy
kubectl proxy --port="${PROXY_PORT}" --address='0.0.0.0' --accept-hosts='^.*' &
PROXY_PID=$!
trap 'kill ${PROXY_PID} >/dev/null 2>&1 || true' EXIT

# Execute terraform
echo "Execute terraform..."
terraform init
terraform plan
terraform apply -auto-approve

# Check the container
MINIKUBE_IP="$(minikube ip)"
NODE_PORT="$(terraform output -raw nginx_node_port)"

echo "Curl to nginx container..."
curl "${MINIKUBE_IP}:${NODE_PORT}"

if command -v ngrok >/dev/null 2>&1; then
  echo "Starting ngrok tunnel to ${MINIKUBE_IP}:${NODE_PORT}"
  ngrok http "${MINIKUBE_IP}:${NODE_PORT}"
else
  echo "ngrok is not installed. Skipping tunnel setup."
fi
