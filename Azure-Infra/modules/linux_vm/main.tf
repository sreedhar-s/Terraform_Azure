resource "azurerm_linux_virtual_machine" "linuxvm" {
  for_each = var.linux_vm 
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password

  network_interface_ids = [
    each.value.network_interface_ids[0]
  ]

  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  boot_diagnostics {
    storage_account_uri = each.value.boot_diagnostics.storage_account_uri
  }

  encryption_at_host_enabled = true

  source_image_id = each.value.source_image_id

  tags = each.value.tags
}