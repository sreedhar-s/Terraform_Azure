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

variable "route_table" {
    type = map(object({
        name = string,
        location = string,
        rg_name = string
    }))
}