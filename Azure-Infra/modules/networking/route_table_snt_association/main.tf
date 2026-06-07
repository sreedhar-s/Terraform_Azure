resource "azurerm_subnet_route_table_association" "example" {
  for_each = var.route_table_snt_association 
  subnet_id      = each.value.subnet_id
  route_table_id = each.value.route_table_id
}