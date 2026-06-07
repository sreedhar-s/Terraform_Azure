resource "azurerm_virtual_network_peering" "vnt_peering" {
  name                      = var.vnt_peering.name
  resource_group_name       = var.vnt_peering.rg_name
  virtual_network_name      = var.vnt_peering.vnt_name
  remote_virtual_network_id = var.vnt_peering.remote_vnt_id
  allow_virtual_network_access = var.vnt_peering.allow_virtual_network_access
  allow_forwarded_traffic = var.vnt_peering.allow_forwarded_traffic
  allow_gateway_transit = var.vnt_peering.allow_gateway_transit
  use_remote_gateways = var.vnt_peering.use_remote_gateways
}
