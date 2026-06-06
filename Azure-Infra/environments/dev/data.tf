data "azurerm_virtual_network" "hub_vnt" {
  provider = azurerm.hub
  name                = "OI-VNT"
  resource_group_name = "OI-VNT-RG"
}

data "azurerm_resource_group" "gallery_rg" {
  provider = azurerm.Infra-Monitoring-Backup
  name = "WIN-GLD-CMN-RG"
}

data "azurerm_shared_image_gallery" "image-gallery" {
  provider = azurerm.Infra-Monitoring-Backup
  name                = "OlamImages"
  resource_group_name = data.azurerm_resource_group.gallery_rg.name
}

data "azurerm_shared_image" "shared_image" {
  provider = azurerm.Infra-Monitoring-Backup
  name                = "Windows_2022_FEB_2026"
  gallery_name        = data.azurerm_shared_image_gallery.image-gallery.name
  resource_group_name = data.azurerm_resource_group.gallery_rg.name
}

data "azurerm_shared_image_version" "image_version" {
  provider = azurerm.Infra-Monitoring-Backup
  name                = "0.0.1"
  image_name          = data.azurerm_shared_image.shared_image.name
  gallery_name        = data.azurerm_shared_image_gallery.image-gallery.name
  resource_group_name = data.azurerm_resource_group.gallery_rg.name
}

