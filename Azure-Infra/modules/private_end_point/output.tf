output "private_ip_address" {
  description = "The private_ip_address of the endpoint"
    value       = {
        for k, v in azurerm_private_endpoint.kvt_private_endpoint.private_service_connection : k => v.private_ip_address
    }
}