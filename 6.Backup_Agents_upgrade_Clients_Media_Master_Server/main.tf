# Master Server
resource "vsphere_virtual_machine" "master_server" {
  name             = "master-server"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
}

# Media Server
resource "vsphere_virtual_machine" "media_server" {
  name             = "media-server"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
}

# Client Server
resource "vsphere_virtual_machine" "client_server" {
  name             = "client-server"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
}
