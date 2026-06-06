output "private_ip_address" {
  description = "The private_ip_address of the endpoint"
    value       = {
        for k, v in azurerm_private_endpoint.kvt_private_endpoint : k => v.private_service_connection[0].private_ip_address
    }
}