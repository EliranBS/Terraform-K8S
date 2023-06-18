#!/bin/bash

# Check if Minikube is running
if ! minikube status &>/dev/null; then
  # Start the minikube
  echo "Minikube is not running. Starting Minikube...
    "
  minikube start
else
  echo "Minikube is already running"
fi

# Configure the kubectl proxy
kubectl proxy --port=34343 --address='0.0.0.0' --accept-hosts='^.*' &

# Execute the terrafrom
echo "
Execute terraform..."
terraform init
terraform plan
terraform apply -auto-approve

# Check the container, curl <minikube ip>:<NodePort>
echo "
Curl to nginx container...
"
curl "$(minikube ip)":31211

# config auth in ngrok (add yourself authtoken)
ngrok config add-authtoken "<Authtoken>"

# run the ngrok
ngrok http "$(minikube ip)":31211
