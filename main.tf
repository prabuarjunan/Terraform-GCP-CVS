// Configure the Google Cloud provider
provider "google" {
 credentials = file("/Users/arjunan/Downloads/cloud-heroes-c03315584bc8.json")
 project     = "cloud-heroes"
 region      = "us-central1"
}