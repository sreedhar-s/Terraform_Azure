variable "linux_vm" {
    type = map(object({
        name = string
        resource_group_name = string
        location            = string
        size                = string
        admin_username      = string
        admin_password      = string

        network_interface_ids = list(string)

        os_disk = object({
            caching = string
            storage_account_type = string 
        })

        boot_diagnostics = object({
            storage_account_uri = string
        })

        encryption_at_host_enabled = bool

        source_image_id = string

        tags = map(string)
    }))
}