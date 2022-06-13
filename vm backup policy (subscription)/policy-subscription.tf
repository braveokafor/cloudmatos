resource "azurerm_policy_definition" "vm-backup-policy-definition" {
  name         = "backup-vm-to-recovery-services-vault"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Enable Backup on VMs without a given tag to a recovery services vault"
  description  = "Enable Backup on VMs without a given tag to a recovery services vault"

  metadata = <<METADATA
    {
    "category": "Backups"
    }

METADATA

  # UPDATE PARAMETERS SECTION OF THE RULE DEFINITION WITH YOUR ENVIRONMENT'S DETAILS.
  # THE REQUIRED PARAMETERS ARE: "backupVaultResourceGroup", "backupVault" & "backupPolicy".
  policy_rule = <<POLICY_RULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Compute/virtualMachines"
      }
    ]
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "roleDefinitionIds": [
        "/providers/microsoft.authorization/roleDefinitions/9980e02c-c2be-4d73-94e8-173b1dc7cf3c",
        "/providers/microsoft.authorization/roleDefinitions/5e467623-bb1f-42f4-a55d-6e525e11384b"
      ],
      "type": "Microsoft.RecoveryServices/backupprotecteditems",
      "existenceCondition": {
        "allOf": [
          {
            "field": "name",
            "like": "*"
          }
        ]
      },
      "deployment": {
        "properties": {
          "mode": "incremental",
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "vmName": {
                "type": "string"
              },
              "vmResourceGroup": {
                "type": "string"
              },
              "backupVaultResourceGroup": {
                "type": "string"
              },
              "backupVault": {
                "type": "string"
              },
              "backupPolicy": {
                "type": "string"
              }
            },
            "variables": {
              "backupIntentConcat": "[concat('/Azure/vm;iaasvmcontainerv2;',parameters('vmResourceGroup'),';',parameters('vmName'))]"
            },
            "resources": [
              {
                "apiVersion": "2017-05-10",
                "name": "[concat(parameters('vmName'), '-' , 'backupIntent')]",
                "type": "Microsoft.Resources/deployments",
                "resourceGroup": "[parameters('backupVaultResourceGroup')]",
                "properties": {
                  "mode": "Incremental",
                  "template": {
                    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                    "contentVersion": "1.0.0.0",
                    "resources": [
                      {
                        "name": "[concat(parameters('backupVault'),variables('backupIntentConcat'))]",
                        "apiVersion": "2017-07-01",
                        "type": "Microsoft.RecoveryServices/vaults/backupFabrics/backupProtectionIntent",
                        "properties": {
                          "protectionIntentItemType": "AzureResourceItem",
                          "policyId": "[concat(resourceId('Microsoft.RecoveryServices/vaults/backuppolicies',parameters('backupVault'),parameters('backupPolicy')))]",
                          "sourceResourceId": "[concat(resourceId('Microsoft.Compute/virtualMachines',parameters('vmName')))]"
                        }
                      }
                    ]
                  }
                }
              }
            ]
          },
          "parameters": {
            "vmName": {
              "value": "[field('name')]"
            },
            "vmResourceGroup": {
              "value": "[resourcegroup().name]"
            },
            "backupVaultResourceGroup": {
              "value": "test-security-policies-rg"
            },
            "backupVault": {
              "value": "recovery-vault"
            },
            "backupPolicy": {
              "value": "recovery-vault-policy"
            }
          }
        }
      }
    }
  }
}
POLICY_RULE
}

data "azurerm_subscription" "subscription" {}

resource "azurerm_subscription_policy_assignment" "vm-backup-policy-assignment" {
  name                 = "backup-vm-to-recovery-services-vault-assignment"
  subscription_id      = data.azurerm_subscription.subscription.id
  policy_definition_id = azurerm_policy_definition.vm-backup-policy-definition.id
}

resource "azurerm_subscription_policy_remediation" "vm-backup-policy-remediation" {
  name                 = "backup-vm-to-recovery-services-vault-remediation"
  subscription_id      = data.azurerm_subscription.subscription.id
  policy_assignment_id = azurerm_subscription_policy_assignment.vm-backup-policy-assignment.id
}