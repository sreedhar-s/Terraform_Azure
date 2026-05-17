module "resource_group" {
    source = "../../modules/resource_group"
    rgs = var.rgs
}

module "virtual_network" {
    source = "../../modules/virtual_network"
    vnet = var.vnet
    depends_on = [ module.resource_group ]
}

module "subnet" {
    source = "../../modules/subnet"
    snet = var.snet
    depends_on = [ module.virtual_network ]
}