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
