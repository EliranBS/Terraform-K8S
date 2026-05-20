# Terraform-K8S

This project provisions a basic Kubernetes setup on Minikube using Terraform and deploys a simple NGINX application exposed via a NodePort service.

## What the project does

- Connects to a Kubernetes cluster (default: `minikube`).
- Creates a dedicated namespace for the application.
- Creates an NGINX deployment.
- Creates a NodePort service to expose the application externally.
- Provides a helper script to run Minikube + Terraform + a connectivity check.

## File structure

- `provider.tf` – Kubernetes provider configuration and cluster connection settings.
- `variables.tf` – Configuration variables (image, namespace, replicas, ports, context, host, kubeconfig).
- `namespace.tf` – Namespace resource definition.
- `deployment.tf` – NGINX deployment resource definition.
- `service.tf` – NodePort service resource definition.
- `outputs.tf` – Useful outputs (namespace, service name, NodePort, sample URL).
- `tf-script.sh` – Local helper script for end-to-end setup.

## Requirements

- Terraform (recent version)
- Minikube
- kubectl
- (Optional) ngrok

## Quick start

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

After apply, test the service:

```bash
curl "$(minikube ip):$(terraform output -raw nginx_node_port)"
```

## Example customization via variables

```bash
terraform apply -auto-approve \
  -var='image=nginx:1.27' \
  -var='replicas=2' \
  -var='service_node_port=31212' \
  -var='service_port=8081'
```

## Notes

- The default `kube_host` assumes a local proxy setup and may need adjustment in other environments.
- Exposing `kubectl proxy` on `0.0.0.0` is intended for local testing only.
