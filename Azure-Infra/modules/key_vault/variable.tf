variable "key_vault" {
    type = map(object({
        name                        = string
        location                    = string
        resource_group_name         = string
        tenant_id                   = string
        soft_delete_retention_days  = number
        purge_protection_enabled    = bool
        public_network_access_enabled = bool

        sku_name = string
    }))
}