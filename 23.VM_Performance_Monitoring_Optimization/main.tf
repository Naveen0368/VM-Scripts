provider "vsphere" {
  user           = "your_username"
  password       = "your_password"
  vsphere_server = "vcenter.example.com"
}

resource "vsphere_virtual_machine" "my_vm" {
  name             = "my-vm"
  resource_pool_id = "resource-pool-id"
  datastore_id     = "datastore-id"
  folder           = "vm-folder"

  num_cpus = 2
  memory   = 4096

  # Existing disk
  disk {
    label            = "my-vm-disk"
    size             = 100  # Existing disk size in GB
    eagerly_scrub    = false
    thin_provisioned = true
  }

  # Additional disks
  disk {
    label            = "my-vm-disk2"
    size             = 200  # Additional disk 1 size in GB
    eagerly_scrub    = false
    thin_provisioned = true
  }

  disk {
    label            = "my-vm-disk3"
    size             = 300  # Additional disk 2 size in GB
    eagerly_scrub    = false
    thin_provisioned = true
  }
}

