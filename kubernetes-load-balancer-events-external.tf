resource "kubernetes_service" "events-external" {
  metadata {
    name      = "events-external"
    namespace = kubernetes_namespace.n.metadata[0].name
  }
  spec {
    selector = {
      App = kubernetes_deployment.events-external.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}


output "lb_external_status" {
  value = kubernetes_service.events-external.status
}
