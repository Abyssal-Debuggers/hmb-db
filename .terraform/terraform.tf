terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }
  }
}

provider "docker" {}

provider "kubernetes" {
  config_path    = var.kube-path
  config_context = var.kube-context
}
