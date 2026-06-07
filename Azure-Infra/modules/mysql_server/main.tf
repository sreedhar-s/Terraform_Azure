resource "azurerm_mysql_flexible_server" "mysql-flexible-server" {
  for_each = var.mysql-flexible-server  
  name                   = each.value.mysql-flexible-server.name
  resource_group_name    = each.value.mysql-flexible-server.resource_group_name
  location               = each.value.mysql-flexible-server.location
  administrator_login    = each.value.mysql-flexible-server.administrator_login
  administrator_password = each.value.mysql-flexible-server.administrator_password
  backup_retention_days  = each.value.mysql-flexible-server.backup_retention_days
  sku_name               = each.value.mysql-flexible-server.sku_name
  public_network_access = each.value.mysql-flexible-server.public_network_access
  version = each.value.mysql-flexible-server.version

  storage {
    size_gb = each.value.mysql-flexible-server.storage.size_gb
    auto_grow_enabled = each.value.mysql-flexible-server.storage.auto_grow_enabled
  }
}
