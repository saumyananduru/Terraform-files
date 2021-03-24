resource "kubernetes_service" "events-internal" {
  metadata {
    name      = "events-internal"
    namespace = kubernetes_namespace.n.metadata[0].name
  }
  spec {
    selector = {
      App = kubernetes_deployment.events-internal.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 8082
    }

    type = "ClusterIP"
  }
}


output "lb_internal_status" {
  value = kubernetes_service.events-internal.status
}
