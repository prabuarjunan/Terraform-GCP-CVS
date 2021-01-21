resource "google_compute_instance" "default" {
  #project      = "472019236458"
  name         = "netappcvsterrafom"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}


