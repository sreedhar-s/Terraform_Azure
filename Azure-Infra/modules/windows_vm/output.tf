output "vm_id" {
  description = "The ID of the created virtual machine"
    value       = {
        for k, v in azurerm_windows_virtual_machine.windowsvm : k => v.id
    }
}