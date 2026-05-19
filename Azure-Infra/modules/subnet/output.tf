output "snt_id" {
  description = "The ID of the created subnet"
#   value       = azurerm_subnet.snt.id
    value       = {
        for k, v in azurerm_subnet.snt : k => v.id
    }
}

output "snt_name" {
  description = "The name of the subnet"
  value       = {
        for k, v in azurerm_subnet.snt : k => v.name
  }
}