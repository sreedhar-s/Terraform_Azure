resource "azurerm_mysql_flexible_server" "mysql-flexible-server" {
  for_each = var.mysql-flexible-server  
  name                   = var.mysql-flexible-server.name
  resource_group_name    = var.mysql-flexible-server.resource_group_name
  location               = var.mysql-flexible-server.location
  administrator_login    = var.mysql-flexible-server.administrator_login
  administrator_password = var.mysql-flexible-server.administrator_password
  backup_retention_days  = var.mysql-flexible-server.backup_retention_days
  sku_name               = var.mysql-flexible-server.sku_name
  public_network_access = var.mysql-flexible-server.public_network_access
  version = var.mysql-flexible-server.version

  storage {
    size_gb = var.mysql-flexible-server.storage.size_gb
    auto_grow_enabled = var.mysql-flexible-server.storage.auto_grow_enabled
    io_scaling_enabled = var.mysql-flexible-server.storage.io_scaling_enabled
  }
}
