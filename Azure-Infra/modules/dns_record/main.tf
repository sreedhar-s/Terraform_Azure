resource "azurerm_private_dns_a_record" "kvt_private_dns_record" {
  for_each = var.dns_record  
  name                = var.dns_record.name
  zone_name           = var.dns_record.zone_name
  resource_group_name = var.dns_record.resource_group_name
  ttl                 = var.dns_record.ttl
  records             = [var.dns_record.records[0]]
}