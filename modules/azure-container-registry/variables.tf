# variables.tf


### ACR

variable "acr_name" {
    type    = string
}

variable "acr_location" {
    type    = string
}

variable "acr_sku" {
    type    = string
    default = "Basic"
}

variable "acr_admin_enabled" {
    type    = bool
    default = true
}

### RSG

variable "resource_group" {
    type = string
    #default = "rsg-acr-001"
}

variable "location" {
    type = string
    #default = "eastus"
}

### TAGS

variable "environementtag" {
    type = string
    #default = "infra"
}

variable "billing-code" {
    type = string
    #default = "010"
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
    type = map
    default = {
        "global"        = "glob"
        "centralus"     = "cus1"
        "eastus"        = "eus1"
        "eastus2"       = "eus2"
        "westeurope"    = "weu1"
        "northeurope"   = "neu1"
    }
}