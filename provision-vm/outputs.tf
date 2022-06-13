output "vm-id" {
  description = "The id of the newly created VM"
  value       = azurerm_virtual_machine.vm.id
}

output "rg-id" {
  description = "The id of the newly created Resource Group"
  value       = azurerm_resource_group.resource-group.id
}