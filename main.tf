# ===================================================================
# Main Terraform File
# This file contains all the assicated blocks related to infrastructure
# ===================================================================
# ===================================================================
# GCP Compute Instance
# ===================================================================
resource "google_compute_instance" "myE2" {
  name         = var.GCPInstanceName
  machine_type = var.GCPInstanceType
  zone         = var.GCPzone

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = var.GCPInstanceImage
    }
  }

  network_interface {
    network = module.network.network_name
    subnetwork = module.network.subnets_names[0]
    access_config {
       // Left blank to assign public IP
    }
  }

  metadata_startup_script = file("/Scripts/startup.sh")

}
