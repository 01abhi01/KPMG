
resource "azurerm_network_interface" "example" {
  name                = var.network_interface
  location            = data.azurerm_resource_group_location
  resource_group_name = data.azurerm_resource_group_name

  ip_configuration {
    name                          = ""
    subnet_id                     = ""
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine.main" "main" {
  name                  = ""
  location              = ""
  resource_group_name   = ""
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = "Standard_DS1_v2"
  admin_username = ""
  admin_password = "data.azurerm_key_vault_secret.secret_value"  # This is not created in this code, but this is how secrets can be reference from Keyvaults
  
  netwrork_interface_ids = [
    azurerm_network_interface.example.id
  ]
  
  identity {
    type = "User Assigned"
    identity_ids = ""
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = ""
    version   = "latest"
  }
  storage_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  tags = {
    environment = "staging"
  }
  depends_on = [azurerm_linux_virtual_machine.main]
}
