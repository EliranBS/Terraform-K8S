resource "kubernetes_service" "nginx-service" {
  metadata {
    name = "nginx-service"
    # Path to namespace name
    namespace = kubernetes_namespace.nginx_namespace.metadata[0].name
  }

  spec {
    selector = {
      # Path to deployment label
      app = kubernetes_deployment.nginx-deployment.metadata[0].labels.app
    }

    port {
      port        = var.service_port
      target_port = var.container_port
      node_port   = var.service_node_port
    }

    type = "NodePort"
  }
}
