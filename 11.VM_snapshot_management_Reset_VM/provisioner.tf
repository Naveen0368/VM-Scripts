resource "null_resource" "snapshot_management" {
  triggers = {
    vm_id = vsphere_virtual_machine.vm.id
  }

  provisioner "local-exec" {
    command = "powershell.exe -File take_snapshot.ps1 -VmId ${self.triggers.vm_id}"
  }

  depends_on = [
    vsphere_virtual_machine.vm
  ]
}

