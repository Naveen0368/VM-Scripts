resource "vsphere_virtual_machine" "windows_server" {
  # Ensure this name matches the VM name in vSphere
  name             = "NameOfYourWindowsServerVM"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  # Depending on how your VM was configured, you might need to specify other attributes
  # such as network interface, disk size, etc.
}

# Data sources to fetch the resource pool and datastore dynamically
data "vsphere_resource_pool" "pool" {
  name          = "your-resource-pool"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = "your-datastore"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datacenter" "dc" {
  name = "your-datacenter"
}

