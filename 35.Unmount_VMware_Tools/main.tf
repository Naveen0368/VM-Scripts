provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "datacenter-name"
}

data "vsphere_virtual_machine" "vm" {
  name          = "vm-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_disk" "disk" {
  size          = 20
  vmdk_path     = "disks/disk1.vmdk"
  datacenter_id = data.vsphere_datacenter.dc.id
  datastore_id  = data.vsphere_datastore.ds.id
  type          = "thin"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "vm-name"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id

  // Specify the disk to unmount
  disk {
    label            = "disk1"
    unit_number      = 1
    datastore_id     = data.vsphere_datastore.ds.id
    path             = vsphere_virtual_disk.disk.vmdk_path
    attach           = false
  }
}

// Note: This script assumes that the disk is not part of the VM template and is a separate disk.
// The 'attach' parameter is set to 'false' to unmount the disk.

