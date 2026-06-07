resource "azurerm_key_vault" "keyvault" {
  for_each = var.key_vault
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  tenant_id                   = each.value.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled
  public_network_access_enabled = each.value.public_network_access_enabled

  sku_name = each.value.sku_name
}