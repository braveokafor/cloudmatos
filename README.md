<h1 align="center">
  Configure Azure VM Backups
</h1>
<p align="center">These scripts setup Azure VM Backups at different resouce scopes.</p>

<br/>
<hr/>

## <p align="center">⚡️ How it Works</p>

<br/>
<p>
<b>At the VM scope:</b>

<ul>
<li> Creates a [Recovery Vault](https://docs.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview). </li>
<li> Creates a [Recovery Vault Policy](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare#create-a-custom-policy). </li>
<li> Imports a list of VM names (set in terraform.tfvars) </li>
<li> Configures [Backups](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare#apply-a-backup-policy) for each VM. </li>
</ul>


<b>At the Resource Group scope:</b>

<ul>
<li> Creates a [Recovery Vault](https://docs.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview). </li>
<li> Creates a [Recovery Vault Policy](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare#create-a-custom-policy). </li>
<li> [Defines](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure) an [Azure Policy](https://docs.microsoft.com/en-us/azure/governance/policy/overview) to scan for VM's without a "Backup Configuration". </li>
<li> [Assigns](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/assignment-structure) the "VM Backup" Policy to the Resource Group. </li>
<li> [Remediates](https://docs.microsoft.com/en-us/azure/governance/policy/how-to/remediate-resources) non-compliant VM's (i.e: Configures VM Backups). </li>
</ul>


<b>At the Subscription scope:</b>

<ul>
<li> Creates a [Recovery Vault](https://docs.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview). </li>
<li> Creates a [Recovery Vault Policy](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare#create-a-custom-policy). </li>
<li> [Defines](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure) an [Azure Policy](https://docs.microsoft.com/en-us/azure/governance/policy/overview) to scan for VM's without a "Backup Configuration". </li>
<li> [Assigns](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/assignment-structure) the "VM Backup" Policy to the Subscription. </li>
<li> [Remediates](https://docs.microsoft.com/en-us/azure/governance/policy/how-to/remediate-resources) non-compliant VM's (i.e: Configures VM Backups). </li>
</ul>

</p>

<br/>
<hr/>