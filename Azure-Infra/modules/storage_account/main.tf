resource "azurerm_storage_account" "stg_acc" {
  for_each = var.stg_acc  
  name = each.value.name
  resource_group_name      = each.value.resource_group_name 
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  public_network_access_enabled = each.value.public_network_access_enabled
  allow_nested_items_to_be_public = each.value.allow_nested_items_to_be_public

  blob_properties {
    container_delete_retention_policy {
      days = each.value.blob_properties.container_delete_retention_policy.days
    }

    delete_retention_policy {
      days = each.value.blob_properties.delete_retention_policy.days
    }
  }

   tags = each.value.tags
}

