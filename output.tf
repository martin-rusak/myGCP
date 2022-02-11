# ===================================================================
# Output Terraform File
# This file contains all the assicated outouts related to all components
# ===================================================================
# ===================================================================
# GCP Compute Instance Outputs
# ===================================================================
output "ip" {
  value = google_compute_instance.myE2.network_interface.0.access_config.0.nat_ip
}
