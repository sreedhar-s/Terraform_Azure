module "resource_group" {
    source = "../../modules/resource_group"

    rg = {
        stg_rg = {
            name = "DT-DEV-STG-RG"
            location = "southeastasia"
        }
    }
}

module "storage_account" {
    source = "../../modules/storage_account"

    stg_acc = {
        stg_acc1 = {
            name = "dtstgdiag5001"
            resource_group_name      = module.resource_group.rg_name["stg_rg"]
            location                 = "southeastasia"
            account_tier             = "Standard"
            account_replication_type = "LRS"
            public_network_access_enabled = false
            allow_nested_items_to_be_public = false

            blob_properties = {
                container_delete_retention_policy = {
                    days = 7
                }

                delete_retention_policy ={
                    days = 7
                }
            }

            tags = {
                "Application name" = "Testing",
                "Environment" = "Dev"
            }
        }
    }
}

module "private_endpoint" {
    source = "../../modules/private_end_point"

    pvl = {
        dtstgdev4001-pvl = {
            name                = "dtstgdev4001-pvl"
            location            = "southeastasia"
            resource_group_name = module.resource_group.rg_name["stg_rg"]
            subnet_id           = data.azurerm_subnet.snt.id

            private_service_connection = {
                name                           = "stg-privateserviceconnection"
                private_connection_resource_id = module.storage_account.stg_id["stg_acc1"]
                is_manual_connection           =  false
                subresource_names              = ["blob"]
            }

            private_dns_zone_group = {
                name = data.azurerm_private_dns_zone.private_dns_zone.name
                private_dns_zone_ids = [ data.azurerm_private_dns_zone.private_dns_zone.id ]
            }
        }
    }

    depends_on = [ module.storage_account ]
}

module "dns_record" {
    providers = {
        azurerm = azurerm.Olam-Shared-Infrastructure
    }
    source = "../../modules/dns_record"
    dns_record = {
        dns_record1 = {
            name                = "dtstgdev4001"
            zone_name           = data.azurerm_private_dns_zone.private_dns_zone.name
            resource_group_name = data.azurerm_private_dns_zone.private_dns_zone.resource_group_name
            ttl                 = 10
            records             = [module.private_endpoint.pvl["dtstgdev4001-pvl"].private_ip_address]
        }
    }

    depends_on = [ module.private_endpoint ]
}