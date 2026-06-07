module "resource_group" {
    source = "../../modules/resource_group"

    rg = {
        pgsql_rg = {
            name = "DT-DB-RG"
            location = "southeastasia"
        }
    }
}

module "postgressql_server" {
    source = "../../modules/postgressql_server"

    postgressql-server = {
        "server1" = {
            name                          = "dt-pdb-dev-4001"
            resource_group_name           = module.resource_group.rg_name["pgsql_rg"]
            location                      = "southeastasia"
            version                       = "18"
            public_network_access_enabled = false
            administrator_login           = "psqladmin"
            administrator_password        = "pssql@123"

            storage_mb   = 32768
            storage_tier = "P4"

            sku_name   = "GP_Standard_D2ds_v5"
        }
    }

    depends_on = [ module.resource_group ]
}

module "private_endpoint" {
    source = "../../modules/private_end_point"

    pvl = {
        dt-sdb-dev-4001-pvl = {
            name                = "dt-pdb-dev-4001-pvl"
            location            = "southeastasia"
            resource_group_name = module.resource_group.rg_name["pgsql_rg"]
            subnet_id           = data.azurerm_subnet.snt.id

            private_service_connection = {
                name                           = "mysql-privateserviceconnection"
                private_connection_resource_id = module.postgressql_server.postgressqlserver_id["server1"]
                is_manual_connection           =  false
                subresource_names              = ["postgresqlServer"]
            }

            private_dns_zone_group = {
                name = data.azurerm_private_dns_zone.private_dns_zone.name
                private_dns_zone_ids = [ data.azurerm_private_dns_zone.private_dns_zone.id ]
            }
        }
    }

    depends_on = [ module.postgressql_server ]
}