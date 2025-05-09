output "cluster_name" {
  description = "Wingie Enuygun Cluster."
  value       = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  description = "The endpoint of the GKE cluster."
  value       = google_container_cluster.primary.endpoint
  sensitive   = true
}

output "cluster_location" {
  description = "The location (region or zone) of the GKE cluster."
  value       = google_container_cluster.primary.location
} 