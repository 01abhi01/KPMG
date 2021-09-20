resource "azurerm_resource_group" "rg_name" {
  name     = ""
  location = "e"
}

resource "azurerm_public_ip" "ip_address {
  name                = ""
  location            = "West US"
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "loadbal" {
  name                = "TestLoadBalancer"
  location            = "West US"
  resource_group_name = azurerm_resource_group.rg_name.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.ip_address.id
  }
}
