output "mssqlserver_id" {
    description = "The ID of the Mssql server"

    value = {
        for k,v in azurerm_mssql_server.mssql_server : k => v.id
    }
}