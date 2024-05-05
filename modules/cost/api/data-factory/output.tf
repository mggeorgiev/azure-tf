output "resource_group_name" {
  value       = local.resource_group_name
  description = "The resource group name that where the resoruces are deployed."
}

output "azurerm_data_factory_id" {
  value       = azurerm_data_factory.df.id
  description = "The ID of the Data Factory."
}

output "azurerm_data_factory_identity" {
  value       = azurerm_data_factory.df.identity
  description = "The ID of the Data Factory."
}

output "azurerm_data_factory_principal_id" {
  value       = azurerm_data_factory.df.identity.principal_id
  description = "The Principal ID associated with this Managed Service Identity."
}

output "azurerm_data_factory_tenant_id" {
  value       = azurerm_data_factory.df.identity
  description = "The Tenant ID associated with this Managed Service Identity."
}

output "azurerm_role_definition_uuid" {
  value       = azurerm_role_definition.manage-document-intelligence.uuid
  description = "The document intelligence custom role uuid."
}

output "azurerm_role_definition_name" {
  value       = azurerm_role_definition.manage-document-intelligence.name
  description = "The document intelligence custom role name."
}