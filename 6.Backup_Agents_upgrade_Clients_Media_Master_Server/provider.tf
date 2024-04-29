provider "vsphere" {
  user           = "your-vsphere-username"
  password       = "your-vsphere-password"
  vsphere_server = "your-vsphere-server"

  # If you have a self-signed certificate
  allow_unverified_ssl = true
}
