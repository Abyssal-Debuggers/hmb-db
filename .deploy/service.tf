resource "kubernetes_namespace" "hmb-db" {
  metadata {
    name = "hmb-db"
  }
}

resource "kubernetes_service" "hmb-db" {
  metadata {
    name      = "hmb-db"
    namespace = kubernetes_namespace.hmb-db.metadata[0].name
  }
  spec {
    selector = {
      "app" = "hmb-db"
    }
    port {
      name = "postgresql"
      port = var.postgres_port
    }
  }
}


resource "kubernetes_stateful_set" "hmb-db" {
  metadata {
    name      = "hmb-db"
    namespace = kubernetes_namespace.hmb-db.metadata[0].name
  }
  spec {
    service_name = kubernetes_service.hmb-db.metadata[0].name
    replicas     = 1

    selector {
      match_labels = {
        "app" = "hmb-db"
      }
    }
    template {
      metadata {
        labels = {
          "app" = "hmb-db"
        }
      }
      spec {
        container {
          name  = "database"
          image = var.database_image
          resources {
            requests = {
              "cpu"    = "1000m"
              "memory" = "500Mi"
            }
            limits = {
              "cpu"    = "1500m"
              "memory" = "1Gi"
            }
          }
          port {
            name           = "postgresql"
            container_port = var.postgres_port
          }
        }
      }
    }
  }
}
