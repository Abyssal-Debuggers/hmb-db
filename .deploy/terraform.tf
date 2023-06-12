terraform {
  backend "gcs" {
    bucket = "abyssal-debugger-terraform"
    prefix = "terraform"
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


