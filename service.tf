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
      port        = 8080
      target_port = 80
      node_port   = 31211
    }

    type = "NodePort"
  }
}
