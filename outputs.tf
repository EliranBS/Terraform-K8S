output "namespace" {
  description = "The Kubernetes namespace name"
  value       = kubernetes_namespace.nginx_namespace.metadata[0].name
}

output "service_name" {
  description = "The Kubernetes service name"
  value       = kubernetes_service.nginx-service.metadata[0].name
}

output "nginx_node_port" {
  description = "NodePort exposed by nginx service"
  value       = var.service_node_port
}

output "sample_access_url" {
  description = "Sample URL for local access (minikube IP required)"
  value       = "http://<minikube-ip>:${var.service_node_port}"
}
