# Specify the provider and access details
provider "netapp-gcp" {
  # numerical project number (not project ID)
  # alternatively, set GCP_PROJECT environment variable
  project         = "472019236458"
  service_account = "/Users/arjunan/Downloads/cloud-heroes-c03315584bc8.json"

  # path to JSON key file for IAM service account with "roles/netappcloudvolumes.admin" privileges
  # alternatively, set GCP_SERVICE_ACCOUNT environment variable
  # service_account = "/Users/abc/key.json"
}

terraform {
  required_version = ">= 0.13"
  required_providers {
    netapp-gcp = {
      source = "NetApp/netapp-gcp"
      version = "~> 20.11.1"
    }
  }
}