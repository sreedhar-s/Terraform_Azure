data "azurerm_virtual_network" "hub_vnt" {
  provider = azurerm.hub

  name                = var.remote_to_local.vnt_name
  resource_group_name = var.remote_to_local.rg_name
}