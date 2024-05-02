resource "null_resource" "shutdown_vm" {
  triggers = {
    vm_id = vsphere_virtual_machine.vm.id
  }

  provisioner "local-exec" {
    command = "powershell.exe -File shutdown_vm.ps1 -VmId ${self.triggers.vm_id}"
  }

  depends_on = [
    vsphere_virtual_machine.vm
  ]
}

