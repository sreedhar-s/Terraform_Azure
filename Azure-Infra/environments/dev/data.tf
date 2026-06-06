data "azurerm_virtual_network" "hub_vnt" {
  provider = azurerm.hub
  name                = "OI-VNT"
  resource_group_name = "OI-VNT-RG"
}

data "azurerm_private_dns_zone" "private_dns_zone" {
  provider = azurerm.Olam-Shared-Infrastructure
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = "OI-DNS-PRD-EG"
}

data "azurerm_subnet" "snt" {
  name                 = "DT-DEV-SNET1"
  virtual_network_name = "DT-DEV-VNT"
  resource_group_name  = "DT-VNT-RG"
}