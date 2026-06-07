output "postgressqlserver_id" {
    description = "The ID of the Postgres server"

    value = {
        for k,v in azurerm_postgresql_flexible_server.postgresql-flexible-server : k => v.id
    }
}