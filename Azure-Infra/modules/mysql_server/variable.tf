variable "mysql-flexible-server" {
    type = map(object({
        name                   = string
        resource_group_name    = string
        location               = string
        administrator_login    = string
        administrator_password = string
        backup_retention_days  = number
        sku_name               = string
        public_network_access = bool
        version = string

        storage = object({
            size_gb = number
            auto_grow_enabled = bool
            io_scaling_enabled = bool
        })
    }))
}