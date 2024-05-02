# vsphere login account (defaults to admin account)
variable "vsphere_user" {
  default = "administrator@vsphere.local"
}

# vsphere account password (empty by default)
variable "vsphere_password" {}

# vsphere server (defaults to localhost)
variable "vsphere_server" {
  default = "localhost"
}

# vsphere datacenter where the VM will be deployed (empty by default)
variable "vsphere_datacenter" {}

# vsphere resource pool for the VM (empty by default)
variable "vsphere_resource_pool" {}

# vsphere datastore for the VM (empty by default)
variable "vsphere_datastore" {}

# vsphere network for the VM (empty by default)
variable "vsphere_network" {}

# vsphere VM template to clone from (empty by default)
variable "vsphere_virtual_machine_template" {}

# Name of the new VM to be created (empty by default)
variable "vsphere_virtual_machine_name" {}

