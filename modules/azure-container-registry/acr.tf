resource "azurerm_resource_group" "rsg-acr" {
    name                    = var.resource_group_name
    location                = var.location

    tags = {
        reviewbefore = formatdate("YYYY-MMM-DD",timeadd(timestamp(), "9m")),
        environment = var.environementtag,
        billing-code = var.billing-code
    }
}

resource "azurerm_container_registry" "acr" {
  name                     = var.location
  resource_group_name      = azurerm_resource_group.private-acr.name
  location                 = azurerm_resource_group.private-acr.location
  sku                      = var.acr_sku
  admin_enabled            = var.acr_admin_enabled
  #georeplication_locations = ["West Europe"]
}