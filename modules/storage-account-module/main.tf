locals {
  common_tags = {
    environementtag = var.environementtag
    billing-code = var.billing-code
  }
}

resource "azurerm_storage_account" "storageaccount" {
    name                        = var.storage_account_name
    resource_group_name         = var.resource_group
    location                    = var.sto_location
    account_tier                = var.account_tier
    account_replication_type    = var.account_replication_type

    tags = merge( local.common_tags, var.custom_tags)
}
