# ===================================================================
# Networking Terraform File
# This file contains all the assicated blocks related to networking
# ===================================================================
# ===================================================================
# Main GCP VPC module
# ===================================================================
module "network" {
  source  = "terraform-google-modules/network/google"
  version = "4.1.0"
  project_id   = var.GCPproject
  network_name = var.GCPvpc

  subnets = [
        {
            subnet_name           = var.GCPVPCsubnet
            subnet_ip             = var.GCPcidr
            subnet_region         = var.GCPregion
        },
    ]

    secondary_ranges = {
        subnet-01 = []
    }

    routes = [
        {
            name                   = "egress-internet"
            description            = "route through IGW to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
            next_hop_internet      = "true"
        },
    ]
}
# ===================================================================
# Sub GCP VPC module for Firewall
# ===================================================================
module "net-firewall" {
  source                  = "terraform-google-modules/network/google//modules/fabric-net-firewall"
  project_id              = var.GCPproject
  network                 = module.network.network_name
  internal_ranges_enabled = true
  internal_ranges         = ["${var.GCPcidr}"]
  internal_target_tags    = ["internal"]
}

# ===================================================================
# GCP Compute Firewall
# ===================================================================
resource "google_compute_firewall" "myFWRules" {
  name    = "web-fw01"
  network = module.network.network_name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
  source_ranges = ["0.0.0.0/0"]
}
