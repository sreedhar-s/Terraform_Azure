output "kvt_id" {
    description = "The Id of the key vault"

    value = {
        for k,v in azurem.azurerm_key_vault.keyvault : k => v.id
    }
}