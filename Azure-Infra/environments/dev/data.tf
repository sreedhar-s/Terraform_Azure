data "azurerm_virtual_network" "hub_vnt" {
  provider = azurerm.hub

  name                = var.local_to_remote.vnt_name
  resource_group_name = var.local_to_remote.rg_name
}