module "vnet" {
  source = "git::https://github.com/01abhi01/KPMG.git"
  resource_group_name = 
  vnet_name = 
  address space = 
  subnets = {
    subnet 1= {
      name = ""
      address_prefixes = []
        service_endpoints = []
    }
     subnet 2= {
      name = ""
      address_prefixes = []
        service_endpoints = []
    }
     subnet 3= {
      name = ""
      address_prefixes = []
        service_endpoints = []
    }
  # Naming convention left blank because that would follow organisation specific namings.
    
    
    
   # Private DNS Zones
    
    resource "azurerm_private_dns_zone "dns_zones" {
     for_each = var. private_dns_zones
     name = each.key
     resource_group_name = 
     }
     
    
    # Private DNS Zone VNET Links
    resource "azurerm_private_dns_zone_virtual_network_link" "dns_zone_links" {
    for_each = var. private_dns_zones
     name = each.value
     resource_group_name =
     virtual_network_id = 
    
     depends_on = [azurerm_private_dns_zone.dns_zones
     ]
     
    # Private DNS Zone A records
      resource "azurerm_private_dns_a_record" "dns_a_record" {
     for_each = var. dns_a_record
     name = each.value.name
     zone_name = each.value.zone_name
     ttl = 300
     records = each.value.records
  
     depends_on = [azurerm_private_dns_zone.dns_zones
     ]
     }
     
     # Create NSG
     
  resource "azurerm_network_security_group" "nsg1" {
  name                = ""
  location            = 
  resource_group_name = 
  
  lifecycle {
    ignore_changes = [tags]
    }
    }

  security_rule {
    name                       = "NSG-rule-1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = ""
  }
}

# Systen User defined Routes

resource "azurerm_route" "default-route" {
  name                = ""
  location            = 
  resource_group_name = 
  route_table_name = 
  address_prefix = "0.0.0.0/0"
  next_hop_type = "VirtualAppliance"
  next_hop_in_ip_address = var.hub_firewall_ip 
 }
 
# In the above route, there has to be a default route table, and since the   address_prefix = "0.0.0.0/0", next_hop is a firewall.




