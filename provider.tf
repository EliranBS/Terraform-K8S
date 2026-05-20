provider "kubernetes" {
  # Set the context cluster
  config_context_cluster = var.kube_context_cluster

  # Set the kubeconfig
  config_path = var.kube_config_path

  # Set the host (The port from the tf-script.sh file in line 10)
  host = var.kube_host
}
