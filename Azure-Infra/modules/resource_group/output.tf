output "rg_id" {
  description = "The ID of the created resource group"
  value       = {
        for k, v in azurerm_resource_group.rg : k => v.id
  }
}

output "rg_name" {
  description = "The name of the created resource group"
  value       = {
        for k, v in azurerm_resource_group.rg : k => v.name
  }
}