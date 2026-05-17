variable "vnet" {
    type = map(object({
        name = string,
        address_space = list(string),
        rg_name = string,
        location = string
    }))
}