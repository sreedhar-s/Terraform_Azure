output "stg_id" {
  description = "The ID of the created storage account"
    value       = {
        for k, v in azurerm_storage_account.stg_acc.id : k => v.id
    }
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint of the created storage account"
    value       = {
        for k, v in azurerm_storage_account.stg_acc.primary_blob_endpoint: k => v.primary_blob_endpoint
    }
}