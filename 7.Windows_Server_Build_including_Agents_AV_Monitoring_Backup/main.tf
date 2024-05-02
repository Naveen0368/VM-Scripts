resource "vsphere_virtual_machine" "windows_vm" {
  name             = "new-windows-server"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 4
  memory   = 8192
  guest_id = data.vsphere_virtual_machine.template.guest_id

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      windows_options {
        computer_name  = "new-windows-server"
        workgroup      = "WORKGROUP"
        admin_password = "secure-password"
      }

      network_interface {
        ipv4_address = "10.10.10.100"
        ipv4_netmask = 24
      }

      ipv4_gateway = "10.10.10.1"
    }
  }
}

