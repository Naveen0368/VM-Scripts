resource "vsphere_virtual_machine" "vm" {
  # Existing configuration...

  num_cpus = 4  # Updated CPU count
  memory   = 8192  # Updated memory in MB
}

