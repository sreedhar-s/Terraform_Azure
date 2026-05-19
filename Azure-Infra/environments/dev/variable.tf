variable "rgs" {
    type = map(object(
        {
            name = string,
            location = string
        }
    ))
}

variable "vnt" {
    type = map(object({
        name = string,
        address_space = list(string),
        rg_name = string,
        location = string
    }))
}

variable "snt" {
    type = map(object({
        name = string,
        address_prefixes = list(string),
        rg_name = string,
        vnt_name = string
    }))
}

variable "vnt_peering" {
    type = object({
        name = string,
        rg_name = string,
        vnt_name = string,
        remote_vnt_id = string,
        allow_virtual_network_access = bool,
        allow_forwarded_traffic = bool,
        allow_gateway_transit = bool,
        use_remote_gateways = bool
    })
}
