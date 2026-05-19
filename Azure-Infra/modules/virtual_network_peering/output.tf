output "remote_vnt_peering_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network_peering.remote_to_local.name
}

output "local_vnt_peering_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network_peering.local_to_remote.name
}