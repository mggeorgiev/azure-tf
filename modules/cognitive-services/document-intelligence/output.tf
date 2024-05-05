output "resource_group_name" {
  value       = local.resource_group_name
  description = "The resource group name that where the resoruces are deployed."
}

output "azurerm_cognitive_account_name" {
  value       = azurerm_cognitive_account.cognitive_service.name
  description = "The document intelligence name."
}


output "azurerm_role_definition_uuid" {
  value       = azurerm_role_definition.manage-document-intelligence.uuid
  description = "The document intelligence custom role uuid."
}

output "azurerm_role_definition_name" {
  value       = azurerm_role_definition.manage-document-intelligence.name
  description = "The document intelligence custom role name."
}