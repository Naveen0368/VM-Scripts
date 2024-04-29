provider "vsphere" {
  user           = "your-username"
  password       = "your-password"
  vsphere_server = "vcenter.example.com"

  # If you have a self-signed SSL certificate
  allow_unverified_ssl = true
}

