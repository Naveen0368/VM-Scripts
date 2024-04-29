# Example for a Linux master server
resource "vsphere_virtual_machine" "master_server" {
  # VM configuration...

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("${path.module}/ssh/id_rsa")
      host        = self.default_ip_address
    }

    inline = [
      "sudo apt-get update && sudo apt-get install -y backup-agent"
    ]
  }

}
resource "vsphere_virtual_machine" "media_server" {
  # VM configuration...
  depends_on = [vsphere_virtual_machine.master_server]

	    "remote-exec" {
    # Provisioner configuration...
  }
}

resource "vsphere_virtual_machine" "client_server" {
  # VM configuration...
  depends_on = [vsphere_virtual_machine.media_server]

  provisioner "remote-exec" {
    # Provisioner configuration...
  }
}

