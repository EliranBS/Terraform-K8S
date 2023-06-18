# Create Kubernetes deployment
resource "kubernetes_deployment" "nginx-deployment" {
  metadata {
    name = "nginx-deployment"
    # Path to namespace name
    namespace = kubernetes_namespace.nginx_namespace.metadata[0].name
    labels = {
      app = "nginx-deployment"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nginx-deployment"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx-deployment"
        }
      }

      spec {
        container {
          # the image variable in variables.tf file
          image = var.image
          name  = "nginx"
        }
      }
    }
  }
}
