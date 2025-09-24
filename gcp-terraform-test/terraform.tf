terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.28.0"
    }
  }
}

provider "google" {
  # Configuration options
  region  = "us-central1"
  project = "peaceful-impact-455101-e1"
}
