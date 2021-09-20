resource azurerm_virtual_network "vnet" {
  name = var.vnet_name
  resource_group_name= var.rg_name
  location = var. vnet_location
  address_space = var.address_space
  tags= var.tags
}
resource "azurerm_subnet" "subnet" {
  for_each = var.subnets
  
  resource_group_name= var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  name = each.value.name
  address_prefixes = each.value.address_prefixes 
  service_endpoints= each.value.service_endpoints
  
}
  
