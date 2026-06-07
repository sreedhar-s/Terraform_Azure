output "mysqlserver_id" {
    description = "The ID of the Mysql server"

    value = {
        for k,v in azurerm_mysql_flexible_server.mysql-flexible-server : k => v.id
    }
}