// Configure the Google Cloud provider
provider "google" {
 credentials = file(var.credentials_file)
 project = var.project
 region      = "us-central1"
}