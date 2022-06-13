<h1 align="center">
  Configure Azure VM Backups
</h1>
<h3 align="center">These scripts setup Azure VM Backups at different resouce scopes.</h3>

## <p align="center">⚡️ How it Works</p>

<p>
<h2>At the VM scope:</h2>

- Creates a [Recovery Vault](https://docs.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview) `./vm backup (vm id)/recovery-vault.tf`. 
- Creates a [Recovery Vault Policy](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare#create-a-custom-policy). 
- Imports a list of VM names (set in terraform.tfvars). 
- Configures [Backups](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare#apply-a-backup-policy) for each VM. 

<h2>At the Resource Group scope:</h2>

- Creates a [Recovery Vault](https://docs.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview). 
- Creates a [Recovery Vault Policy](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare#create-a-custom-policy). 
- [Defines](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure) an [Azure Policy](https://docs.microsoft.com/en-us/azure/governance/policy/overview) to scan for VM's without a "Backup Configuration". 
- [Assigns](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/assignment-structure) the "VM Backup" Policy to the Resource Group. 
- [Remediates](https://docs.microsoft.com/en-us/azure/governance/policy/how-to/remediate-resources) non-compliant VM's (i.e: Configures VM Backups). 

<h2>At the Subscription scope:</h2>

- Creates a [Recovery Vault](https://docs.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview). 
- Creates a [Recovery Vault Policy](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare#create-a-custom-policy). 
- [Defines](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure) an [Azure Policy](https://docs.microsoft.com/en-us/azure/governance/policy/overview) to scan for VM's without a "Backup Configuration". 
- [Assigns](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/assignment-structure) the "VM Backup" Policy to the Subscription. 
- [Remediates](https://docs.microsoft.com/en-us/azure/governance/policy/how-to/remediate-resources) non-compliant VM's (i.e: Configures VM Backups). 

</p>
