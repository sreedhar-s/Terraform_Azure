resource "azurerm_mssql_server" "mssql_server" {
  for_each = var.mssql-server
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  public_network_access_enabled = each.value.public_network_access_enabled
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}
