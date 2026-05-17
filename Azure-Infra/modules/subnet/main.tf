resource "azurerm_subnet" "snet" {
  for_each = var.snet
  name                 = each.value.name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnt_name
  address_prefixes     = each.value.address_prefixes
}