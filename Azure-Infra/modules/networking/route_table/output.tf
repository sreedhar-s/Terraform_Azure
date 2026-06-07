output "rtb_id" {
  description = "The ID of the created route table"
    value       = {
        for k, v in azurerm_route_table.route_table : k => v.id
    }
}

output "rtb_name" {
  description = "The name of the created route table"
    value       = {
        for k, v in azurerm_route_table.route_table : k => v.name
    }
}
