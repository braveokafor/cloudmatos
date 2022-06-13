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

# RECOVERY VAULT
variable "backup-time" {
  description = "Time to backup VM's (in 24 hour format)"
  type        = string
}
variable "backup-retention-period" {
  description = "Number of days to retain each backup"
  type        = string
}

# AZURE POLICIES
variable "backup-scope" {
  description = "Resource id to apply the policy, can be a subscription, resource group or resource"
  type        = string
}
