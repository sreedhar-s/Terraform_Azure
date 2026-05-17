variable "snet" {
    type = map(object({
        name = string,
        address_prefixes = list(string),
        rg_name = string,
        vnt_name = string
    }))
}