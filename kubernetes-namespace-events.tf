resource "kubernetes_namespace" "n" {
  metadata {
    name = "development"
    labels = {
      name = "development"
    }
  }
}