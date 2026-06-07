resource "azurerm_route_table" "route_table" {
  for_each = var.route_table
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
}

