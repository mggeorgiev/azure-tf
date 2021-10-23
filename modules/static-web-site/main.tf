resource "azurerm_resource_group" "static_web_site_rg" {
    name                    = var.resource_group.name
    location                = var.resource_group.location
    tags                    = var.resource_group.tags
}

resource "azurerm_storage_account" "storage_account" {
  name                      = "martingeorgievdata001"
  resource_group_name       = azurerm_resource_group.static_web_site_rg.name
  location                  = azurerm_resource_group.static_web_site_rg.location
  account_tier              = var.storage_account.account_tier #"Standard"
  account_replication_type  = var.storage_account.account_replication_type #"LRS"
  account_kind              = var.storage_account.account_kind #"StorageV2"
    
  static_website {
    index_document = "index.html"
  }

  tags  = var.storage_account.tags
}

resource "azurerm_storage_container" "wwwroot" {
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "container"
}