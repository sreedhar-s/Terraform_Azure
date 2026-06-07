resource "azurerm_mssql_database" "mssql_db" {
  for_each = var.mssql-db
  name         = each.value.name
  server_id    = each.value.server_id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  storage_account_type = each.value.storage_account_type
}
