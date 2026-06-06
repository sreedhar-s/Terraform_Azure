variable "stg_acc" {
    type = map(object({
        name = string
        resource_group_name      = string
        location                 = string
        account_tier             = string
        account_replication_type = string
        public_network_access_enabled = bool
        allow_nested_items_to_be_public = bool

        blob_properties = object(
            {
                container_delete_retention_policy =  object({
                    days = number
                })

                delete_retention_policy = object({
                   days = number
                })
            }
        )
        tags = map(string)
    }))
}