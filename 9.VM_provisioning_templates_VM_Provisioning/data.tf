data "vsphere_datacenter" "dc" {
  name = "your-datacenter-name"
}

data "vsphere_datastore" "datastore" {
  name          = "your-datastore-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "your-resource-pool-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "your-network-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "your-linux-template-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

