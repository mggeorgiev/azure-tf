resource "random_string" "azurerm_data_factory_name" {
  length  = 13
  lower   = true
  numeric = false
  special = false
  upper   = false
}

resource "azurerm_data_factory" "df" {
  name                   = "DataFactory-${random_string.azurerm_data_factory_name.result}"
  location               = var.location
  resource_group_name    = local.resource_group_name
  public_network_enabled = true

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}