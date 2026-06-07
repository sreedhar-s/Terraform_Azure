output "mssqldb_id" {
    description = "The ID of the Mssql DB"

    value = {
        for k,v in azurerm_mssql_database.mssql_db : k => v.id
    }
}
