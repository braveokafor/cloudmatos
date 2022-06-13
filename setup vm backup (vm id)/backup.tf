data "azurerm_virtual_machine" "vm" {
  count               = length(var.vm-names)
  name                = var.vm-names[count.index]
  resource_group_name = var.resource-group-name
}

resource "azurerm_backup_protected_vm" "backup" {
  count               = length(var.vm-names)
  source_vm_id        = data.azurerm_virtual_machine.vm[count.index].id
  resource_group_name = var.resource-group-name
  recovery_vault_name = azurerm_recovery_services_vault.recovery-vault.name
  backup_policy_id    = azurerm_backup_policy_vm.recovery-vault-policy.id
}
