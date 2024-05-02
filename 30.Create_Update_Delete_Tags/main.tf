provider "vsphere" {
  user        = "your-username"
  password    = "your-password"
  host        = "your-vsphere-host"
  datacenter  = "your-datacenter"
  insecure    = true
  ssl_verify  = false
}

resource "vsphere_tag" "example_tag" {
  name        = "example-tag"
  category    = "example-category"
}

resource "vsphere_tag_assignment" "example_tag_assignment" {
  tag_id      = vsphere_tag.example_tag.id
  entity      = vsphere_virtual_machine.example_vm.id
  entity_type = "VirtualMachine"
}

resource "vsphere_tag" "updated_example_tag" {
  name        = "updated-example-tag"
  category    = "example-category"
  depends_on  = [vsphere_tag.example_tag]
}

resource "vsphere_tag_assignment" "updated_example_tag_assignment" {
  tag_id      = vsphere_tag.updated_example_tag.id
  entity      = vsphere_virtual_machine.example_vm.id
  entity_type = "VirtualMachine"
}

resource "vsphere_tag" "deleted_example_tag" {
  name        = "deleted-example-tag"
  category    = "example-category"
  depends_on  = [vsphere_tag.example_tag]
}

resource "null_resource" "remove_tag_assignment" {
  provisioner "local-exec" {
    command = "terraform state rm vsphere_tag_assignment.example_tag_assignment"
  }
}

resource "null_resource" "add_vm_to_ad" {
  provisioner "local-exec" {
    command = "vSphereClient add_vm_to_ad ${vsphere_virtual_machine.example_vm.name} ${ad_domain} ${ad_user} ${ad_password}"
  }
}

resource "null_resource" "remove_vm_from_ad" {
  provisioner "local-exec" {
    command = "vSphereClient remove_vm_from_ad ${vsphere_virtual_machine.example_vm.name} ${ad_domain} ${ad_user} ${ad_password}"
  }
}

