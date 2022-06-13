<h1 align="center">
  Configure Azure VM Backups
</h1>
<h3 align="center">These scripts setup Azure VM Backups at different resouce scopes.</h3>

## <p align="center">⚡️ How it Works</p>

<p>
<h2>At the VM scope:</h2>

|                                                             Action                                                                   |               tf file                  |
|--------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------|
| Creates a [Recovery Vault](https://docs.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview)              |`./vm-backup-vm-scope/recovery-vault.tf`| 
| Creates a [Recovery Vault Policy](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare#create-a-custom-policy) |`./vm-backup-vm-scope/recovery-vault.tf`| 
| Imports a list of VM's                                                                                                               |`./vm-backup-vm-scope/terraform.tfvars` |
| Configures [Backups](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare#apply-a-backup-policy) for each VM   |`./vm-backup-vm-scope/backups.tf`       |

#### 🛠 Usage

<h2>At the Resource Group scope:</h2>

|                                                       Action                                                                                                                                                                              |                           tf file                           |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
| Creates a [Recovery Vault](https://docs.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview).                                                                                                                  | `./vm-backup-policy-resource-group-scope/recovery-vault.tf` |
| Creates a [Recovery Vault Policy](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare#create-a-custom-policy).                                                                                                     | `./vm-backup-policy-resource-group-scope/recovery-vault.tf` |
| [Defines](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure) an [Azure Policy](https://docs.microsoft.com/en-us/azure/governance/policy/overview) to scan for VM's without a "Backup Configuration". | `./vm-backup-policy-resource-group-scope/policy-rg.tf`      |
| [Assigns](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/assignment-structure) the "VM Backup" Policy to the Resource Group.                                                                                           | `./vm-backup-policy-resource-group-scope/policy-rg.tf`      |
| [Remediates](https://docs.microsoft.com/en-us/azure/governance/policy/how-to/remediate-resources) non-compliant VM's (i.e: Configures VM Backups).                                                                                        | `./vm-backup-policy-resource-group-scope/policy-rg.tf`      |

<h2>At the Subscription scope:</h2>

|                                                       Action                                                                                                                                                                              |                                tf file                         |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| Creates a [Recovery Vault](https://docs.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview).                                                                                                                  | `./vm-backup-policy-subscription-scope/recovery-vault.tf`      |
| Creates a [Recovery Vault Policy](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare#create-a-custom-policy).                                                                                                     | `./vm-backup-policy-subscription-scope/recovery-vault.tf`      |
| [Defines](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure) an [Azure Policy](https://docs.microsoft.com/en-us/azure/governance/policy/overview) to scan for VM's without a "Backup Configuration". | `./vm-backup-policy-subscription-scope/policy-subscription.tf` |
| [Assigns](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/assignment-structure) the "VM Backup" Policy to the Subscription.                                                                                             | `./vm-backup-policy-subscription-scope/policy-subscription.tf` |
| [Remediates](https://docs.microsoft.com/en-us/azure/governance/policy/how-to/remediate-resources) non-compliant VM's (i.e: Configures VM Backups).                                                                                        | `./vm-backup-policy-subscription-scope/policy-subscription.tf` |

</p>
