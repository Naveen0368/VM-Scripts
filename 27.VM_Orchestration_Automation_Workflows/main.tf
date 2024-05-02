provider "vsphere" {
  user        = "your-username"
  password    = "your-password"
  host        = "your-vsphere-host"
  datacenter  = "your-datacenter"
  insecure    = true
  ssl_verify  = false
}

resource "vsphere_virtual_machine" "example_vm" {
  name            = "example-vm"
  datastore       = "your-datastore"
  network_interface {
    network_name = "your-network-1"
  }
  # Add other VM configuration options as needed
}

resource "vsphere_virtual_machine_network_interface" "additional_nics" {
  count          = 2
  vm_name        = vsphere_virtual_machine.example_vm.name
  network_name   = "your-network-${count.index + 2}"
  adapter_type   = "e1000e"
  # Add other network interface configuration options as needed
}

resource "vsphere_virtual_machine" "example_vm_updated" {
  name            = "example-vm-updated"
  datastore       = "your-datastore"
  network_interface {
    network_name = "your-network-1"
  }
  network_interface {
    network_name = "your-network-2"
  }
  network_interface {
    network_name = "your-network-3"
  }
  # Add other VM configuration options as needed
}

resource "vsphere_virtual_machine_power" "shutdown" {
  vm_name = vsphere_virtual_machine.example_vm.name
  state   = "powered_off"
}

resource "vsphere_virtual_machine_power" "startup" {
  vm_name = vsphere_virtual_machine.example_vm_updated.name
  state   = "powered_on"
}

