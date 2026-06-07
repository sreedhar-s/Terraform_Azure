variable "mssql-server" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    public_network_access_enabled = bool
    version                      = string
    administrator_login          = string
    administrator_login_password = string
  }))
}