resource "azurerm_virtual_network" "aks_vnt" {
  for_each = var.vnet  
  name                = each.value.name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.rg_name
}