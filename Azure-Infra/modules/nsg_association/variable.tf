variable "nsg_association" {
    type = object({
        network_interface_id = string,
        network_security_group_id = string
    })
}