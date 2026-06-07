output "nsg_id" {
  description = "The ID of the created network security group"
    value       = {
        for k, v in azurerm_network_security_group.nsg : k => v.id
    }
}