variable "gcp_project" { type = string }
variable "gcp_region" { type = string }
variable "gcp_zone" { type = string }

variable "kubernetes_config_path" {
  type    = string
  default = "~/.kube/config"
}

variable "kubernetes_config_context" {
  type = string
}

variable "postgres_port" {
  type = number
}

variable "postgres_username" {
  type = string
}

variable "postgres_password" {
  type = string
}

variable "postgres_database" {
  type = string
}

variable "database_image" {
  type = string
}
