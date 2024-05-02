provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "datacenter-name"
}

data "vsphere_datastore" "ds" {
  name          = "datastore-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "cluster-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "network-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "vm-name"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id

  num_cpus = 2
  memory   = 4096
  guest_id = "other3xLinux64Guest"

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 20
  }

  // Ensure VMware Tools is installed for memory utilization management
  vapp {
    properties {
      "tools.syncTime" = "TRUE"
      "tools.toolsUpgradePolicy" = "upgradeAtPowerCycle"
    }
  }
}

// Note: This script assumes VMware Tools is already present in the VM template.
// If not, you will need to install it manually or include it in your VM template.

