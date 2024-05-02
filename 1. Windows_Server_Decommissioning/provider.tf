provider "vsphere" {
  user           = "your-vsphere-username"
  password       = "your-vsphere-password"
  vsphere_server = "your-vsphere-server"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

