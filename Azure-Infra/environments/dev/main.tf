module "resource_group" {
    source = "../../modules/resource_group"

    rg = {
        mssql_rg = {
            name = "DT-DB-RG"
            location = "southeastasia"
        }
    }
}

module "mssql_server" {
    source = "../../modules/databases/mssql_server"

    mssql-server = {
        "server1" = {
            name                         = "dt-sdb-dev-4001"
            resource_group_name          = module.resource_group.rg_name["mssql_rg"]
            location                     = "southeastasia"
            public_network_access_enabled = false
            version                      = "12.0"
            administrator_login          = "sqladmin"
            administrator_login_password = "4,_/6Mhwk0{>SkDX"
        }
    }

    depends_on = [ module.resource_group ]
}

module "mssql_db" {
    source = "../../modules/databases/mssql_database"
    mssql-db = {
        "db1" = {
            name         = "test"
            server_id    = module.mssql_server.mssqlserver_id["server1"]
            collation    = "SQL_Latin1_General_CP1_CI_AS"
            license_type = "LicenseIncluded"
            max_size_gb  = 2
            sku_name     = "GP_Gen5_4"
            storage_account_type = "Local"
        }
    }

    depends_on = [ module.mssql_server ]
}

module "private_endpoint" {
    source = "../../modules/networking/private_end_point"

    pvl = {
        dt-sdb-dev-4001-pvl = {
            name                = "dt-sdb-dev-4001-pvl"
            location            = "southeastasia"
            resource_group_name = module.resource_group.rg_name["mssql_rg"]
            subnet_id           = data.azurerm_subnet.snt.id

            private_service_connection = {
                name                           = "mssql-privateserviceconnection"
                private_connection_resource_id = module.mssql_server.mssqlserver_id["server1"]
                is_manual_connection           =  false
                subresource_names              = ["sqlServer"]
            }

            private_dns_zone_group = {
                name = data.azurerm_private_dns_zone.private_dns_zone.name
                private_dns_zone_ids = [ data.azurerm_private_dns_zone.private_dns_zone.id ]
            }
        }
    }

    depends_on = [ module.mssql_server ]
}