module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.resource-group.name #data.azurerm_resource_group.rg.name
  vnet_name           = "vnet"
  vnet_location       = azurerm_resource_group.resource-group.location #data.azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]
  subnet_names        = ["subnet1", "subnet2"]

  nsg_ids = {
    subnet1 = azurerm_network_security_group.nsg.id
    subnet2 = azurerm_network_security_group.nsg.id
  }

  tags = {
    environment = var.environment
    maintainer  = var.maintainer
    location    = azurerm_resource_group.resource-group.location #data.azurerm_resource_group.rg.location
  }
  depends_on = [
    azurerm_resource_group.resource-group #data.azurerm_resource_group.rg
  ]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg"
  resource_group_name = azurerm_resource_group.resource-group.name     #data.azurerm_resource_group.rg.location
  location            = azurerm_resource_group.resource-group.location #data.azurerm_resource_group.rg.location

  security_rule {
    name                       = "http-allow"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "https-allow"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
