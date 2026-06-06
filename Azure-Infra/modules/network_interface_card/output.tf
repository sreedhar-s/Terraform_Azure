output "nic_id" {
  description = "The ID of the created network interface card"
    value       = {
        for k, v in azurerm_network_interface.nic : k => v.id
    }
}