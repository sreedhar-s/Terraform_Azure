resource "azurerm_subnet" "snt" {
  for_each = var.snt
  name                 = each.value.name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnt_name
  address_prefixes     = each.value.address_prefixes
}