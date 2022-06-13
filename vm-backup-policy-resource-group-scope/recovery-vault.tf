resource "azurerm_recovery_services_vault" "recovery-vault" {
  name                = "recovery-vault"
  location            = var.resource-group-location
  resource_group_name = var.resource-group-name
  sku                 = "Standard"
}

resource "azurerm_backup_policy_vm" "recovery-vault-policy" {
  name                = "recovery-vault-policy"
  resource_group_name = var.resource-group-name
  recovery_vault_name = azurerm_recovery_services_vault.recovery-vault.name

  backup {
    frequency = "Daily"
    time      = var.backup-time
  }

  retention_daily {
    count = var.backup-retention-period
  }
}
