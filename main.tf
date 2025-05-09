provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = "gke-cluster"
  location = var.region

  logging_service    = "none"
  monitoring_service = "none"

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "main_pool" {
  name       = "main-pool"
  cluster    = google_container_cluster.primary.id 
  location   = google_container_cluster.primary.location
  node_count = 1 

  node_config {
    machine_type = "n2d-standard-2" 
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

resource "google_container_node_pool" "application_pool" {
  name    = "application-pool"
  cluster = google_container_cluster.primary.id 
  location = google_container_cluster.primary.location

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    machine_type = "n2d-standard-2" 
    labels = {
      pool = "application-pool"
    }
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
} 