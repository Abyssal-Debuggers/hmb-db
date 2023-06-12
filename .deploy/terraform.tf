terraform {
  backend "gcs" {
    bucket = "abyssal-debugger-terraform"
    prefix = "hmb-db"
  }
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.21.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.68.0"
    }
  }
}


