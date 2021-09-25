output "acr_resource_group_name" {
    value = azurerm_resource_group.rsg-acr.name
}

output "acr_name" {
    value = azurerm_container_registry.acr.name
}

output "acr_location" {
    value = azurerm_container_registry.acr.location
}

output "acr_sku" {
    value = azurerm_container_registry.acr.sku
}

output "acr_admin_enabled" {
  value = azurerm_container_registry.acr.admin_enabled
}