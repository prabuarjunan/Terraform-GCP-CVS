
# Create a volume tied to an account
resource "netapp-gcp_volume" "gcp-volume" {
  provider = netapp-gcp
  name = "deleteme_asap"
  region = "us-west2"
  protocol_types = ["NFSv3"]
  network = "default"
  size = 1024
  service_level = "basic"
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

# Create a snapshot tied to an volume
resource "netapp-gcp_snapshot" "gcp-snapshot" {
  name = "deleteme_asapGO_jusitin-snapshot"
  region = "us-west2"
  volume_name =  "deleteme_asapGO_jusitin"
  # creation_token = "unique-token-number"
}

# Create an Active Directory
resource "netapp-gcp_active_directory" "gcp-active-directory" {
  provider = netapp-gcp
  region = "us-west2"
    username = "test_user"
    password = "netapp"
  domain = "example.com"
  dns_server = "10.0.0.0"
  net_bios = "cvsserver"
}

# Create a volume_backup tied to an volume
resource "netapp-gcp_volume_backup" "gcp-volume-backup" {
  name = "main-volume-backup"
  region = "us-west2"
  volume_name =  "main-volume"
  creation_token = "unique-token-number"
}
#