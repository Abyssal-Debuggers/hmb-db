resource "kubernetes_namespace" "hmb-db" {
  metadata {
    name = "hmb-db"
  }
}

resource "kubernetes_stateful_set" "hmb-db" {
  metadata {
    name      = "hmb-db"
    namespace = kubernetes_namespace.hmb-db.metadata[0].name
  }
  spec {
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
            container_port = var.postgres_database
          }
        }
      }
    }
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
      name = kubernetes_stateful_set.hmb-db.spec[0].template[0].spec[0].container[0].port[0].name
      port = kubernetes_stateful_set.hmb-db.spec[0].template[0].spec[0].container[0].port[0].container_port
    }
  }
}
