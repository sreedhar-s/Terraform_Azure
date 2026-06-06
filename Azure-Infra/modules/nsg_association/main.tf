resource "azurerm_network_interface_security_group_association" "nsg-nic-association" {
  network_interface_id      = var.nsg_association.network_interface_id
  network_security_group_id = var.nsg_association.network_security_group_id
}