module "resource_group" {
    source = "../../modules/resource_group"

    rg = {
        mysql_rg = {
            name = "DT-SDB-RG"
            location = "southeastasia"
        }
    }
}


module "mysql_server" {
    source = "../../modules/mysql_server"

    mysql-flexible-server = {
        "server1" = {
            name                   = "dt-sdb-dev-4001"
            resource_group_name    = module.resource_group.rg_name["mysql_rg"]
            location               = "southeastasia"
            administrator_login    = "mysqladmin"
            administrator_password = "4,_/6Mhwk0{>SkDX"
            backup_retention_days  = 15
            sku_name               = "GP_Standard_D2ds_v4"
            public_network_access = "Disabled"
            version = "8.0.21"

            storage = {
                size_gb = 20
                auto_grow_enabled = false
            }
        }
    }

    depends_on = [ module.resource_group ]
}

module "private_endpoint" {
    source = "../../modules/private_end_point"

    pvl = {
        dt-sdb-dev-4001-pvl = {
            name                = "dt-sdb-dev-4001-pvl"
            location            = "southeastasia"
            resource_group_name = module.resource_group.rg_name["mysql_rg"]
            subnet_id           = data.azurerm_subnet.snt.id

            private_service_connection = {
                name                           = "mysql-privateserviceconnection"
                private_connection_resource_id = module.mysql_server.mysqlserver_id["server1"]
                is_manual_connection           =  false
                subresource_names              = ["mysqlServer"]
            }

            private_dns_zone_group = {
                name = data.azurerm_private_dns_zone.private_dns_zone.name
                private_dns_zone_ids = [ data.azurerm_private_dns_zone.private_dns_zone.id ]
            }
        }
    }

    depends_on = [ module.mysql_server ]
}

module "dns_record" {
    providers = {
        azurerm = azurerm.Olam-Shared-Infrastructure
    }
    source = "../../modules/dns_record"
    dns_record = {
        dns_record1 = {
            name                = "dt-sdb-dev-4001"
            zone_name           = data.azurerm_private_dns_zone.private_dns_zone.name
            resource_group_name = data.azurerm_private_dns_zone.private_dns_zone.resource_group_name
            ttl                 = 10
            records             = [module.private_endpoint.private_ip_address["dt-sdb-dev-4001-pvl"]]
        }
    }

    depends_on = [ module.private_endpoint ]
}