variable "route_table_snt_association" {
    type = map(object({
        subnet_id = string,
        route_table_id = string
    }))
}