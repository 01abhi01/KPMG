variable "resource_group_location" {
  type = string
  default = "eastus"
  
  variable "resource_group_name" {
  type = string
  default = ""
    
  variable "hub_firewall_ip" {
    type = string
    default = ""
    
   variable "private_dns_zones" {
      description = "Map of Private DNS Zone name and Vnet Link name"
     type = map (any)
     default = {
       "key"   =  "value"
     }
     # Organisation specific names to be given
     
     variable "dns_a_records" {
      description = "Map of A records to create"
     type = map (any)
     default = {
       "key"   =  "value"
     }
     # Organisation specific names to be given
