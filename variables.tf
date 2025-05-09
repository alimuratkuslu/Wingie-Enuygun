variable "project_id" {
  description = "The GCP project ID to host the GKE cluster."
  type        = string
}

variable "region" {
  description = "The GCP region for the GKE cluster."
  type        = string
  default     = "europe-west1" # As per task 2, but can be overridden
} 