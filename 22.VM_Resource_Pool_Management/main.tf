provider "vsphere" {
  user           = "your_username"
  password       = "your_password"
  vsphere_server = "vcenter.example.com"
}

# Create a resource pool
resource "vsphere_resource_pool" "my_resource_pool" {
  name          = "my-resource-pool"
  parent        = "cluster-id-or-host-id"
  cpu_allocation = 2000  # CPU shares (adjust as needed)
  memory_allocation = 4096  # Memory shares in MB (adjust as needed)
}

# Create a virtual machine
resource "vsphere_virtual_machine" "my_vm" {
  name             = "my-vm"
  resource_pool_id = vsphere_resource_pool.my_resource_pool.id
  datastore_id     = "datastore-id"
  folder           = "vm-folder"

  num_cpus = 2
  memory   = 4096

  # Add multiple hard disks
  disk {
    label            = "my-vm-disk1"
    size             = 100  # Disk size in GB
    eagerly_scrub    = false
    thin_provisioned = true
  }

  disk {
    label            = "my-vm-disk2"
    size             = 200  # Another disk size in GB
    eagerly_scrub    = false
    thin_provisioned = true
  }
}

