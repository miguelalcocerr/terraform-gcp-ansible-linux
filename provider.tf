terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.66.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "project-ansible2023"
  region = "us-east1"
  zone = "us-east1-b"
  credentials = "./keys.json"
}