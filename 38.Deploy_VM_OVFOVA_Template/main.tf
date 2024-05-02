provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

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

data "vsphere_content_library" "library" {
  name = "content-library-name"
}

data "vsphere_content_library_item" "ovf_template" {
  name             = "template-name"
  content_library_id = data.vsphere_content_library.library.id
}

resource "vsphere_virtual_machine" "vm_from_template" {
  name             = "vm-name"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  clone {
    template_uuid = data.vsphere_content_library_item.ovf_template.id

    customize {
      // Customization options go here
    }
  }

  // Define other VM settings as needed
}

// Note: Replace placeholder values with actual data.
// Ensure the OVF/OVA template is already present in the specified content library.

