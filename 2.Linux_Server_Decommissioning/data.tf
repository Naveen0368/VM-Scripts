data "vsphere_datacenter" "dc" {
  name = "datacenter-name"
}

data "vsphere_datastore" "datastore" {
  name          = "datastore-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "resource-pool-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "network-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "template-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

