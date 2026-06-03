variable "route_table" {
    type = map(object({
        name = string,
        location = string,
        rg_name = string
    }))
}