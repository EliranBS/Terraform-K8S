# The image variable, default is nginx:1.24.0
variable "image" {
  type    = string
  default = "nginx:1.24.0"
}

# Kubernetes context cluster name
variable "kube_context_cluster" {
  type    = string
  default = "minikube"
}

# Path to kubeconfig
variable "kube_config_path" {
  type    = string
  default = "~/.kube/config"
}

# Kubernetes API host (for local proxy usage)
variable "kube_host" {
  type    = string
  default = "http://localhost:34343"
}

# Namespace to deploy nginx resources
variable "namespace_name" {
  type    = string
  default = "nginx"
}

# Number of nginx replicas
variable "replicas" {
  type    = number
  default = 1
}

# Service listening port
variable "service_port" {
  type    = number
  default = 8080
}

# NGINX container port
variable "container_port" {
  type    = number
  default = 80
}

# NodePort exposed by the service
variable "service_node_port" {
  type    = number
  default = 31211
}
