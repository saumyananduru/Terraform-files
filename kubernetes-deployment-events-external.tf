resource "kubernetes_deployment" "events-external" {
  metadata {
    name = "events-external"
    labels = {
      App = "events-external"
    }
    namespace = kubernetes_namespace.n.metadata[0].name
  }

  spec {
    replicas                  = 3
    progress_deadline_seconds = 60
    selector {
      match_labels = {
        App = "events-external"
      }
    }
    template {
      metadata {
        labels = {
          App = "events-external"
        }
      }
      spec {
        container {
          image = "saumyananduru/external-image:V1.0"
          name  = "events-external"
          
          env {
            name = "SERVER"
            value = "http://events-internal"
          }

          port {
            container_port = 8080
          }

          resources {
            limits = {
              cpu    = "0.2"
              memory = "2562Mi"
            }
            requests = {
              cpu    = "0.1"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}