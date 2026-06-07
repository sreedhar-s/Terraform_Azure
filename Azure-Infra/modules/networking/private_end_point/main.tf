resource "azurerm_private_endpoint" "private_endpoint" {
  for_each = var.pvl
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_id           = each.value.subnet_id

  private_service_connection {
    name                           = each.value.private_service_connection.name
    private_connection_resource_id = each.value.private_service_connection.private_connection_resource_id
    is_manual_connection           =  each.value.private_service_connection.is_manual_connection
    subresource_names              = [each.value.private_service_connection.subresource_names[0]]
  }

  private_dns_zone_group {
    name = each.value.private_dns_zone_group.name
    private_dns_zone_ids = [ each.value.private_dns_zone_group.private_dns_zone_ids[0] ]
  }
}