provider "vsphere" {
  user           = "your_username"
  password       = "your_password"
  vsphere_server = "vcenter.example.com"
}

resource "vsphere_virtual_machine" "my_vm" {
  name             = "my-new-vm"
  resource_pool_id = "resource-pool-id"
  datastore_id     = "datastore-id"
  folder           = "vm-folder"

  clone {
    template_uuid = "template-uuid"
  }

  disk {
    label = "Hard Disk 1"
    size  = 50  # Adjust the size as needed
  }
}
