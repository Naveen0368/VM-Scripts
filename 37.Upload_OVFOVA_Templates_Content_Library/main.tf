provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "datacenter-name"
}

resource "vsphere_content_library" "library" {
  name            = "content-library-name"
  datacenter_id   = data.vsphere_datacenter.dc.id
  description     = "My content library for OVF/OVA templates"
  storage_backing {
    datastore_id = data.vsphere_datastore.ds.id
  }
}

resource "vsphere_content_library_item" "ovf_item" {
  name             = "ovf-template-name"
  content_library_id = vsphere_content_library.library.id
  type             = "ovf"
  file_url         = "http://remote-server/ovf-template.ovf"
}

resource "null_resource" "services_restart" {
  depends_on = [vsphere_content_library_item.ovf_item]

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "root"
      password = "your-password"
      host     = "your-esxi-host"
    }

    inline = [
      "service vmware-vpxd restart",
      // Add any other services you wish to restart
    ]
  }
}

// Note: Replace placeholder values with actual data.
// Ensure that SSH service is enabled and accessible on the ESXi host.

