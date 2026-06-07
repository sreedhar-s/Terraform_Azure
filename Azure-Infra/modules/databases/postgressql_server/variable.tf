variable "postgressql-server" {
    type = map(object({
        name                          = string
        resource_group_name           = string
        location                      = string
        version                       = string
        public_network_access_enabled = bool
        administrator_login           = string
        administrator_password        = string

        storage_mb   = number
        storage_tier = string

        sku_name   = string
    }))
}