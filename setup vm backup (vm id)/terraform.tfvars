# GENERAL/ TAGS
environment = "staging"
maintainer  = "Brave Okafor <okaforbrave@gmail.com>"

# RESOURCE GROUP
resource-group-name     = "test-security-policies-rg"
resource-group-location = "East US" #"Germany West Central" # 

# RECOVERY VAULT
backup-time             = "02:00"
backup-retention-period = 30

# VM BACKUP
vm-names                = ["vm"]
