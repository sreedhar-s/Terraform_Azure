


variable "windows_vm" {
    type = map(object({
        name = string
        resource_group_name = string
        location            = string
        size                = string
        admin_username      = string
        admin_password      = string

        network_interface_ids = list(string)

        caching = string
        storage_account_type = string

        storage_account_uri = string

        encryption_at_host_enabled = bool

        source_image_id = string

        tags = map(string)
    }))
}