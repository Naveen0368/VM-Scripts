resource "vsphere_virtual_machine" "vm" {
  # Existing configuration...

  datastore_id     = "new-datastore-id"  # Change to new datastore for storage vMotion
  resource_pool_id = "new-resource-pool-id"  # Change to new resource pool for vMotion
}


resource "vsphere_virtual_machine" "vm" {
  # Existing configuration...

  name = "new-vm-name"  # Updated VM name
}



