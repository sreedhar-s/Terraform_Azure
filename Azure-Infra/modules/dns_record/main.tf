resource "azurerm_private_dns_a_record" "kvt_private_dns_record" {
  for_each = var.dns_record  
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  records             = [each.value.records[0]]
}