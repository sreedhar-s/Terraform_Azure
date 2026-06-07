variable "dns_record" {
    type = map(object({
        name                = string
        zone_name           = string
        resource_group_name = string
        ttl                 = number
        records             = list(string)
    }))
}