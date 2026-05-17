resource "azurerm_subnet" "snet" {
  for_each = var.snet
  name                 = value.name
  resource_group_name  = value.rg_name
  virtual_network_name = value.vnt_name
  address_prefixes     = value.address_prefixes
}