provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
}

resource "vsphere_virtual_machine" "my_vm" {
  name             = var.vsphere_virtual_machine_name
  resource_pool_id = data.vsphere_resource_pool.my_pool.id
  datastore_id     = data.vsphere_datastore.my_datastore.id
  template_uuid    = var.vsphere_virtual_machine_template
  num_cpus         = 2
  memory           = 4096

  # Enable CPU hot-add
  cpu_hot_add_enabled = true
}

data "vsphere_resource_pool" "my_pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = var.vsphere_datacenter
}

data "vsphere_datastore" "my_datastore" {
  name          = var.vsphere_datastore
  datacenter_id = var.vsphere_datacenter
}
