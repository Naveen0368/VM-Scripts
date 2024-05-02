provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
}

# Create a VM from the base image (Packer-built)
resource "vsphere_virtual_machine" "base_vm" {
  name             = "base-vm"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 2
  memory           = 4096
  guest_id         = "other3xLinux64Guest"
  # Other configuration settings as needed
}

# Convert the VM to a template
resource "vsphere_virtual_machine_template" "my_template" {
  name          = "my-template"
  source_vm_id  = vsphere_virtual_machine.base_vm.id
}
