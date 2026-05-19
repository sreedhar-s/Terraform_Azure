output "rg_id" {
  description = "The ID of the created resource group"
  value       = azurerm_resource_group.rg.id
}

output "rg_name" {
  description = "The name of the created resource group"
  value       = azurerm_resource_group.rg.name
}