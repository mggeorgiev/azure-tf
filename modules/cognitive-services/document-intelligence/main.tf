resource "random_string" "azurerm_cognitive_account_name" {
  length  = 13
  lower   = true
  numeric = false
  special = false
  upper   = false
}

resource "azurerm_cognitive_account" "cognitive_service" {
  name                = "CognitiveService-${random_string.azurerm_cognitive_account_name.result}"
  location            = var.location
  resource_group_name = local.resource_group_name
  sku_name            = var.sku
  kind                = "CognitiveServices"
}