output "vnt_peering_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network_peering.vnt_peering.name
}