provider "vsphere" {
  user           = "your-vsphere-username"
  password       = "your-vsphere-password"
  vsphere_server = "your-vsphere-server"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-test"
  resource_pool_id = "your-resource-pool-id"
  datastore_id     = "your-datastore-id"

  num_cpus = 2
  memory   = 1024
  guest_id = "other3xLinux64Guest" # Change this to the appropriate guest ID

  network_interface {
    network_id = "your-network-id"
  }

  disk {
    label = "disk0"
    size  = 20
  }

  clone {
    template_uuid = "your-template-uuid"
  }

  cdrom {
    datastore_id = "your-datastore-id"
    path         = "your-iso-path"
  }
}

