# ===================================================================
# Variables Terraform File
# This file contains all the assicated variables related to all components
# ===================================================================
# GCP Project ID
variable "GCPproject" {
  default = "red-airline-340916"
}

# GCP PRegion
variable "GCPregion" {
  default = "northamerica-northeast2"
}

# GCP Zone
variable "GCPzone" {
  default = "northamerica-northeast2-a"
}

# GCP CIDRs
variable "GCPcidr" {
  default = "10.10.10.0/24"
}

# GCP VPC Name
variable "GCPvpc" {
  default = "mytf-vpc"
}

# GCP VPC Subnet Name
variable "GCPVPCsubnet" {
  default = "subnet-01"
}

# GCP Default Instance Name
variable "GCPInstanceName" {
  default = "test-e2"
}

# GCP Default Instance Type
variable "GCPInstanceType" {
  default = "f1-micro"
}

# GCP Default Instance Images
variable "GCPInstanceImage" {
  default = "centos-cloud/centos-7"
}