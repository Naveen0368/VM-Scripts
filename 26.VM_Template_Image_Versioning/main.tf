# Additional disks
  disk {
    label            = "my-vm-disk2"
    size             = 200  # Additional disk 1 size in GB
    eagerly_scrub    = false
    thin_provisioned = true
  }

  # Add a new network adapter
  network_interface {
    label      = "my-vm-nic1"
    adapter_type = "vmxnet3"
    network_id = "network-id"  # Specify the correct network ID or name
  }
}

# Convert the VM to a template
resource "vsphere_virtual_machine_template" "my_template" {
  name          = "my-vm-template"
  source_vm_id  = vsphere_virtual_machine.my_vm.id
}
