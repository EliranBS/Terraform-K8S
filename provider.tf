provider "kubernetes" {
  # Set the context cluster
  config_context_cluster = "minikube"

  # Set the kubeconfig
  config_path = "~/.kube/config"

  # Set the host (The port from the tf-script.sh file in line 10)
  host = "http://localhost:34343"
}
