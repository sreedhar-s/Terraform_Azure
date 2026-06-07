resource "azurerm_postgresql_flexible_server" "postgresql-flexible-server" {
  for_each = var.postgressql-server
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  location                      = each.value.location
  version                       = each.value.version
  public_network_access_enabled = each.value.public_network_access_enabled
  administrator_login           = each.value.administrator_login
  administrator_password        = each.value.administrator_password

  storage_mb   = each.value.storage_mb
  storage_tier = each.value.storage_tier

  sku_name   = each.value.sku_name
}