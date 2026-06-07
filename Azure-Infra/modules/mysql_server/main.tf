resource "azurerm_mysql_flexible_server" "mysql-flexible-server" {
  for_each = var.mysql-flexible-server  
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  location               = each.value.location
  administrator_login    = each.value.administrator_login
  administrator_password = each.value.administrator_password
  backup_retention_days  = each.value.backup_retention_days
  sku_name               = each.value.sku_name
  public_network_access = each.value.public_network_access
  version = each.value.version

  storage {
    size_gb = each.value.storage.size_gb
    auto_grow_enabled = each.value.storage.auto_grow_enabled
  }
}
