
# Create a volume tied to an account
resource "netapp-gcp_volume" "gcp-volume" {
  provider = netapp-gcp
  name = "deleteme_asap"
  region = "us-west2"
  protocol_types = ["NFSv3"]
  #network = "projects/472019236458/global/networks/herocore-vpc"
  network = "herocore-vpc"
  size = 1024
  service_level = "premium"
  volume_path = "deleteme_asap"
  snapshot_policy {
    enabled = true
    daily_schedule {
      hour = 10
      minute = 1
    }
  }
  export_policy {
    rule {
      allowed_clients = "0.0.0.0/0"
      access= "ReadWrite"
      nfsv3 {
        checked =  true
      }
      nfsv4 {
        checked = false
      }
    }
    rule {
      allowed_clients= "10.0.0.0"
      access= "ReadWrite"
      nfsv3 {
        checked =  true
      }
      nfsv4 {
        checked = false
      }
    }
  }
}

#