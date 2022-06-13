# Environment
variable "environment" {
  description = "environment"
  type        = string
}

# Maintainer
variable "maintainer" {
  description = "maintainer"
  type        = string
}

# RESOURCE GROUP
variable "resource-group-name" {
  description = "resource group name"
  type        = string
}
variable "resource-group-location" {
  description = "resource group location"
  type        = string
}

# BACKUP VAULT
variable "backup-time" {
  description = "Time to backup VM's (in 24 hour format)"
  type        = string
}
variable "backup-retention-period" {
  description = "Number of days to retain each backup"
  type        = string
}

# VM'S
variable "vm-names" {
  description = "List of VM's to enable backup"
  type        = list
}
