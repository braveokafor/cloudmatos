resource "azurerm_network_interface" "nic" {
  name                = "nic"
  location            = azurerm_resource_group.resource-group.location #data.azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.resource-group.name     #data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = module.vnet.vnet_subnets[0]
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "vm"
  location              = azurerm_resource_group.resource-group.location #data.azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.resource-group.name     #data.azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_B1ls"

  delete_os_disk_on_termination = true

  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "vm"
    admin_username = "vmadmin"
    admin_password = "vmPassword@1234"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = var.environment
    maintainer  = var.maintainer
    location    = azurerm_resource_group.resource-group.location #data.azurerm_resource_group.rg.location
  }
}
