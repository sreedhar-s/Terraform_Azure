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