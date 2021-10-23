variable "resource_group" {
  type = object({
    name     = string
    location = string
    tags     = list(string)
  })
  sensitive = false
}

variable "storage_account" {
  type = object({
    name                      = string
    resource_group_name       = string
    location                  = string
    account_tier              = "string"
    account_replication_type  = "string"
    account_kind              = "string"
    tags                      = list(string)
  })
  sensitive = false
}

variable "regions" {
    type = map
    default = {
        "Global"        = "global"
        "Central US"    = "centralus"
        "East US"       = "eastus"
        "East US 2"     = "eastus2"
        "West Europe"   = "westeurope"
        "North Europe"  = "northeurope"
    }
}

variable "namingprefixes" {
    type    = map
    default = {
        "global"        = "glob"
        "centralus"     = "cus1"
        "eastus"        = "eus1"
        "eastus2"       = "eus2"
        "westeurope"    = "weu1"
        "northeurope"   = "neu1"
    }
}