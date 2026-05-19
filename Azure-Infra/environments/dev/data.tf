data "azurerm_virtual_network" "hub_vnt" {
  provider = azurerm.hub

  name                = "OI-VNT"
  resource_group_name = "OI-VNT-RG"
}