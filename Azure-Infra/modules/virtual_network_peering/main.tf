resource "azurerm_virtual_network_peering" "local_to_remote" {
  name                      = var.local_to_remote.name
  resource_group_name       = var.local_to_remote.rg_name
  virtual_network_name      = var.local_to_remote.vnet_name
  remote_virtual_network_id = var.local_to_remote.remote_vnet_id
  allow_virtual_network_access = var.local_to_remote.allow_virtual_network_access
  allow_forwarded_traffic = var.local_to_remote.allow_forwarded_traffic
  allow_gateway_transit = var.var.local_to_remote.allow_gateway_transit
  use_remote_gateways = var.local_to_remote.use_remote_gateways
}

resource "azurerm_virtual_network_peering" "remote_to_local" {
  provider = azurerm.hub 

  name                      = var.remote_to_local.name
  resource_group_name       = var.remote_to_local.rg_name
  virtual_network_name      = var.remote_to_local.vnet_name
  remote_virtual_network_id = var.remote_to_local.local_vnet_id
  allow_virtual_network_access = var.remote_to_local.allow_virtual_network_access
  allow_forwarded_traffic = var.remote_to_local.allow_forwarded_traffic
  allow_gateway_transit = var.var.remote_to_local.allow_gateway_transit
  use_remote_gateways = var.remote_to_local.use_remote_gateways
}
