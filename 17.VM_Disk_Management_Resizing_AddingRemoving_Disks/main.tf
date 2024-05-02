provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
}

resource "vsphere_virtual_machine" "my_vm" {
  name             = "my-vm-name"
  resource_pool_id = "resource-pool-id"
  datastore_id     = "datastore-id"
  num_cpus         = 2
  memory           = 4096

  # Enable memory hot-add
  memory_hot_add_enabled = true

  # Add or modify disks as needed
  disk {
    label = "disk0"
    size  = 50  # Adjust the size as required
  }
}
