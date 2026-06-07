module "resource_group" {
    source = "../../modules/resource_group"

    rg = {
        kvt_rg = {
            name = "DT-KVT-RG"
            location = "southeastasia"
        }
    }
}


module "key_vault" {
    source = "../../modules/key_vault"

    key_vault = {
        "kvt1" = {
            name                        = "DT-KVT-DEV-4001"
            location                    = "southeastasia"
            resource_group_name         = module.resource_group.rg_name["DT-KVT-RG"]
            tenant_id                   = data.azurerm_client_config.current.tenant_id
            soft_delete_retention_days  = 90
            purge_protection_enabled    = false
            public_network_access_enabled = false

            sku_name = "standard"
        }
    }
}

module "private_endpoint" {
    source = "../../modules/private_end_point"

    pvl = {
        DT-KVT-DEV-4001-pvl = {
            name                = "DT-KVT-DEV-4001-pvl"
            location            = "southeastasia"
            resource_group_name = module.resource_group.rg_name["kvt_rg"]
            subnet_id           = data.azurerm_subnet.snt.id

            private_service_connection = {
                name                           = "stg-privateserviceconnection"
                private_connection_resource_id = module.key_vault.kvt_id["kvt1"]
                is_manual_connection           =  false
                subresource_names              = ["vault"]
            }

            private_dns_zone_group = {
                name = data.azurerm_private_dns_zone.private_dns_zone.name
                private_dns_zone_ids = [ data.azurerm_private_dns_zone.private_dns_zone.id ]
            }
        }
    }

    depends_on = [ module.key_vault ]
}

module "dns_record" {
    providers = {
        azurerm = azurerm.Olam-Shared-Infrastructure
    }
    source = "../../modules/dns_record"
    dns_record = {
        dns_record1 = {
            name                = "DT-KVT-DEV-4001"
            zone_name           = data.azurerm_private_dns_zone.private_dns_zone.name
            resource_group_name = data.azurerm_private_dns_zone.private_dns_zone.resource_group_name
            ttl                 = 10
            records             = [module.private_endpoint.private_ip_address["DT-KVT-DEV-4001-pvl"]]
        }
    }

    depends_on = [ module.private_endpoint ]
}