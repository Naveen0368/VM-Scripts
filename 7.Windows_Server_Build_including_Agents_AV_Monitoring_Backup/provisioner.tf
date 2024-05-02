resource "vsphere_virtual_machine" "windows_vm" {
  # Existing VM configuration...

  provisioner "remote-exec" {
    connection {
      type     = "winrm"
      user     = "administrator"
      password = "secure-password"
      host     = self.default_ip_address
    }

    inline = [
      "Install-WindowsFeature -Name Web-Server",
      "choco install -y antivirus-software-package",
      "choco install -y monitoring-agent",
      "choco install -y backup-software"
    ]
  }
}

