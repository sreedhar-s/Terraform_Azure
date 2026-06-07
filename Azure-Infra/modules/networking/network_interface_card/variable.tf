variable "nic" {
    type = map(object({
        name                = string
        location            = string
        resource_group_name = string
        ip_configuration = list(object(
            {
                name = string
                subnet_id = string
                private_ip_address_allocation = string
            }
        ))
    }))
}