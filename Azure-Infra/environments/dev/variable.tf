variable "rgs" {
    type = map(object(
        {
            name = string,
            location = string
        }
    ))
}

variable "vnet" {
    type = map(object({
        name = string,
        address_space = list(string),
        rg_name = string,
        location = string
    }))
}

variable "snet" {
    type = map(object({
        name = string,
        address_prefixes = list(string),
        rg_name = string,
        vnt_name = string
    }))
}