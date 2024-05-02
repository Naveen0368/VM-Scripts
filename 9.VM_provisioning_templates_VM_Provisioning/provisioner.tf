resource "vsphere_virtual_machine" "linux_vm" {
  # Existing VM configuration...

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "root"
      password = "your-root-password"
      host     = self.default_ip_address
    }

    inline = [
      "sudo apt-get update && sudo apt-get upgrade -y",
      "sudo apt-get install -y your-agent-software",
      "sudo apt-get install -y your-antivirus-software",
      "sudo apt-get install -y your-monitoring-tool",
      "sudo apt-get install -y your-backup-software"
    ]
  }
}

