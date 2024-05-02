provider "vsphere" {
  user                 = "your-vsphere-username"
  password             = "your-vsphere-password"
  vsphere_server       = "your-vcenter-server"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "your-datacenter-name"
}

data "vsphere_datastore" "datastore" {
  name          = "your-datastore-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "your-cluster-resource-pool"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "your-network-name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "your-vm-name"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 4096
  guest_id = "other3xLinux64Guest" // Change to match your VM's guest OS

  network_interface {
    network_id = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "disk0"
    size             = 20
    eagerly_scrub    = false
    thin_provisioned = true
  }

  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = "path-to-your-iso.iso"
  }

  clone {
    template_uuid = "template-uuid" // Optional: Only if cloning from a template
  }

  // Static IP configuration
  vapp {
    properties = {
      "guestinfo.ipaddress" = "your-static-ip"
      "guestinfo.netmask"   = "your-netmask"
      "guestinfo.gateway"   = "your-gateway"
      // Add other required properties like DNS, domain, etc.
    }
  }
}

output "vm_ip" {
  value = vsphere_virtual_machine.vm.default_ip_address
}

