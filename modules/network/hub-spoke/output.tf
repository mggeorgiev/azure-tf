output "vnet_subnet_id_spoke1" {
  value = azurerm_subnet.spoke1Subnet.id
}

output "vnet_subnet_id_spoke2" {
  value = azurerm_subnet.spoke2Subnet.id
}