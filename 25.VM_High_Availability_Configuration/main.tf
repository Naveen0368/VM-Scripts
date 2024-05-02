provider "vsphere" {
  user           = "your_username"
  password       = "your_password"
  vsphere_server = "vcenter.example.com"
}

# Create a cluster
resource "vsphere_cluster" "my_cluster" {
  name = "my-cluster"
}

# Create a resource pool within the cluster
resource "vsphere_resource_pool" "my_resource_pool" {
  name          = "my-resource-pool"
  cluster_id    = vsphere_cluster.my_cluster.id
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

  # Add a new network adapter
  network_interface {
    label      = "my-vm-nic2"
    adapter_type = "vmxnet3"
    network_id = "network-id"  # Specify the correct network ID or name
  }
}

