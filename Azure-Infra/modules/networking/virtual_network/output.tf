output "vnt_id" {
  description = "The ID of the created virtual network"
    value       = {
        for k, v in azurerm_virtual_network.vnt : k => v.id
    }
}

output "vnt_name" {
  description = "The name of the virtual network"
  value       = {
        for k, v in azurerm_virtual_network.vnt : k => v.name
  }
}