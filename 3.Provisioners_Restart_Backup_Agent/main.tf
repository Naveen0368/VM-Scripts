provider "vsphere" {
  user           = "your-vsphere-username"
  password       = "your-vsphere-password"
  vsphere_server = "your-vsphere-server"
  allow_unverified_ssl = true
}

resource "vsphere_virtual_machine" "windows_vm" {
  name             = "NameOfYourWindowsServerVM"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus = 2
  memory   = 2048
  guest_id = data.vsphere_virtual_machine.template.guest_id

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 20
  }




  provisioner "remote-exec" {
    connection {
      type     = "winrm"
      user     = "administrator"
      password = "your-password"
      host     = self.default_ip_address
    }

    inline = [
      "Restart-Service -Name 'NameOfYourBackupService'",
      "Restart-Computer -Force"
    ]
  }

  provisioner "local-exec" {
    command = "timeout 120"  # Pause Terraform execution to allow the VM to reboot
  }
}
