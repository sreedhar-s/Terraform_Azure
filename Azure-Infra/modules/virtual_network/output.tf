output "vnt_id" {
  description = "The ID of the created virtual network"
  value       = azurerm_virtual_network.vnt.id
}

output "vnt_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnt.name
}