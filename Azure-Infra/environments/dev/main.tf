module "resource_group" {
    source = "../../modules/resource_group"
    rgs = var.rgs
}

module "virtual_network" {
    source = "../../modules/virtual_network"
    vnt = var.vnt
    depends_on = [ module.resource_group ]
}

module "subnet" {
    source = "../../modules/subnet"
    snt = var.snt
    depends_on = [ module.virtual_network ]
}

module "spoke_to_hub_peering" {    
  source = "../../modules/virtual_network_peering"
  vnt_peering = {
    name = "${module.virtual_network.vnt_name["vnt"]}-TO-${data.azurerm_virtual_network.hub_vnt.name}"
    rg_name = module.resource_group.rg_name["vnt_rg"]
    vnt_name = module.virtual_network.vnt_name["vnt"]
    allow_virtual_network_access = true
    allow_forwarded_traffic = true
    allow_gateway_transit = false
    use_remote_gateways = true
    remote_vnt_id = data.azurerm_virtual_network.hub_vnt.id
  }

  depends_on = [module.virtual_network]
}

module "hub_to_spoke_peering" {   
  providers = {
    azurerm = azurerm.hub
  } 
  source = "../../modules/virtual_network_peering"
  vnt_peering = {
    name = "${data.azurerm_virtual_network.hub_vnt.name}-TO-${module.virtual_network.vnt_name["vnt"]}"
    rg_name = data.azurerm_virtual_network.hub_vnt.resource_group_name
    vnt_name = data.azurerm_virtual_network.hub_vnt.name
    allow_virtual_network_access = true
    allow_forwarded_traffic = true
    allow_gateway_transit = true
    use_remote_gateways = false
    remote_vnt_id = module.virtual_network.vnt_id["vnt"]
  }

  depends_on = [module.virtual_network]
}

module "route_table" {
    source = "../../modules/route_table"
    route_table = var.route_table

    depends_on = [ module.resource_group ]
}

module "routes" {
    source = "../../modules/routes"
    routes = var.routes

    depends_on = [ module.route_table ]
}

module "route_table_snt_association" {
    source = "../../modules/route_table_snt_association"
    route_table_snt_association = {
        rtb_snt_1 = {
            subnet_id = module.subnet.snt_id["snt1"]
            route_table_id = module.route_table.rtb_id["rtb1"]
        },

        rtb_snt_2 = {
            subnet_id = module.subnet.snt_id["snt2"]
            route_table_id = module.route_table.rtb_id["rtb1"]
        },
    }

    depends_on = [ module.route_table, module.subnet ]
} 

module "network_interface" {
    source = "../../modules/network_interface_card"

    nic = {
        "nic1" = {
            name                = "DT-TST-DEV-4001-nic"
            location            = "southeastasia"
            resource_group_name = module.resource_group.rg_name["vm_rg"]

            ip_configuration = [{
                name                          = "ipconfig1"
                subnet_id                     = module.subnet.snt_id["snt1"]
                private_ip_address_allocation = "Dynamic"
            }]
        }
    }

    depends_on = [ module.resource_group, module.subnet ]
}

module "network_security_group" {
    source = "../../modules/network_security_group"
    nsg = var.nsg
}

module "nsg_association" {
    source = "../../modules/nsg_association"

    nsg_association = {
        network_interface_id = module.network_interface.nic_id["nic1"]
        network_security_group_id = module.network_security_group.nsg_id["nsg1"]
    }

    depends_on = [ 
        module.network_interface,
        module.network_security_group
    ]
}

module "windows_wm" {
    source = "../../modules/windows_vm"

    windows_vm = {
        "windows_vm1" = {
            name                = "DT-TST-DEV-4001"
            resource_group_name = module.resource_group.rg_name["vm_rg"]
            location            = "southeastasia"
            size                = "Standard_B2s"
            admin_username      = "azureadmin"
            admin_password      = "CA3@#mw(fg262023"

            network_interface_ids = [
                module.network_interface.nic_id["nic1"]
            ]

            os_disk = {
                caching              = "ReadWrite"
                storage_account_type = "Standard_LRS"
            }

            encryption_at_host_enabled = true

            source_image_id = data.azurerm_shared_image_version.image_version.id

            tags = {
                "Application name" = "Testing",
                "Environment" = "Dev"
            }

            depends_on = [ 
                module.network_interface
            ]
        }
    }
}