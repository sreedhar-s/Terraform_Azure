output "vm_id" {
  description = "The ID of the created virtual machine"
    value       = {
        for k, v in azurerm_linux_virtual_machine.linuxvm : k => v.id
    }
}