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

module "virtual_network_peering_local_to_remote" {   
  source = "../../modules/virtual_network_peering"
  local_to_remote = merge(var.local_to_remote, {
    remote_vnt_id = data.azurerm_virtual_network.remote_vnt.id
  })
  remote_to_local = {}
  depends_on = [module.subnet]
}

module "virtual_network_peering_remote_to_local" {
  providers = {
    azurerm.hub = azurerm.hub
  }
  source          = "../../modules/virtual_network_peering"
  remote_to_local = merge(var.remote_to_local, {
    local_vnt_id = module.virtual_network.vnt[vnt].id
  })
  local_to_remote = {}
  depends_on = [module.subnet]
}