data "azurerm_private_dns_zone" "private_dns_zone" {
  provider = azurerm.Olam-Shared-Infrastructure
  name                = "privatelink.database.windows.net"
  resource_group_name = "OI-DNS-PRD-EG"
}

data "azurerm_subnet" "snt" {
  name                 = "DT-DEV-SNET1"
  virtual_network_name = "DT-DEV-VNT"
  resource_group_name  = "DT-VNT-RG"
}

data "azurerm_client_config" "current" {}