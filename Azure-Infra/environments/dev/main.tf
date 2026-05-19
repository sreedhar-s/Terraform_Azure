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
    name = "DT-DEV-VNT-TO-OI-VNT"
    rg_name = "DT-VNT-RG"
    vnt_name = "DT-DEV-VNT"
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
    name = "DT-DEV-VNT-TO-OI-VNT"
    rg_name = "DT-VNT-RG"
    vnt_name = "DT-DEV-VNT"
    allow_virtual_network_access = true
    allow_forwarded_traffic = true
    allow_gateway_transit = false
    use_remote_gateways = true
    remote_vnt_id = module.virtual_network.vnt_id["DT-DEV-VNT"]
  }

  depends_on = [module.virtual_network]
}