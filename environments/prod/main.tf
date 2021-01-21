// Configure the Google Cloud provider
provider "google" {
 #credentials = file("/Users/arjunan/Downloads/cloud-heroes-c03315584bc8.json")
 #project     = "cloud-heroes"
 credentials = file(var.credentials_file)
 project = var.project
 region      = "us-central1"
}