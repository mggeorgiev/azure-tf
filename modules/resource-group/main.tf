resource "azurerm_resource_group" "resourcegroup" {
    name             = var.resource_group_name
    location         = var.resource_group_location

    tags = {
        environment  = var.environementtag,
        billing-code = var.billing_code
    }
}
