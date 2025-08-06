terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}
variable "project_id" {}
variable "region" {default = "us-central1"}
variable "zone" {default = "us-central1-b"}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}


resource "google_service_account" "default" {
  account_id   = "temp-remote-state-test"
  display_name = "SVC to test Remote State"
}